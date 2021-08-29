# Vector.ai backend assignment

## Table of contents

* [Assignment](#assignment)
* [Running and building](#running-and-building)
* [Testing](#testing)

## Assignment

### Problem
* Implement the entire stack of a very simple backend application which is a simpler variant of Wikipedia that only holds structured information about geographical entities. People around the world can access and update the information.

#### Part 1
* Create a series of tables in an SQL database table to hold the following information:
    * Continent Name (eg. Asia, Europe, etc.)
    * Country Name (eg. UK, USA, Germany, Australia, etc.)
    * City Name (eg. London, Singapore, etc.)
    * Continent Population
    * Country Population
    * City Population
    * Continent Area (sq. meter)
    * Country Area (sq. meter)
    * City Area (sq. meter)
    * City Number of roads
    * City Number of trees
    * Country Number of Hospitals
    * Country Number of National Parks
* The application should also hold some data validation logic. For example, if there are 2 cities in one country, the sum of the population of the 2 cities cannot be greater than the population of the country. Amend the database to hold this kind of information for a few simple validation rules.
* Write scripts in Python to create, update, delete specific values

#### Part 2
* Given the volume of reads, writes and updates, the requests have to be managed via a message broker. Here you can any library and message broker you are comfortable with eg. Kafka, celery with RabbitMQ, etc.
* The architecture we want for our application is something like this
![Architecture](/images/arch.png)
* You should already have written the code for the database and the worker. Implement the code for the client and amend the code for the writer to allow the information to flow through.

### Part 3

* Explain briefly how you designed the system for the validation checks and added that into the database.
> The idea here was to move away from the application code to add the validation in the database itself. Here I have used used SQL Functions and added them as triggers to the tables itself. So anytime a record is being updated or inserted the checks are executed as sepcificed and if the conditions are met then only the transaction is completed or else the customized error is thrown.

* Explain the choices you made in designing the code for the client and message broker related services.
> The application contains 3 major components (+1 rabbitmq component). The idea here was to design in a manner to seperate the components on the basis of their responsibilites and the core functionality. The components are as follows:
1. Sql scripts - These are all the scripts required to setup the postgresql environment along with the dummy data and the functions and triggers. This script executes at the time of the environment setup ensuring the database is ready.
2. Rabbitmq - This section contains the rabbitmq config and the exchange, queues and their binding which again in used at the time of bringing up the environment ready for the other microservices to use.
3. Worker - This is the core module of the application. It contains all the workers logic, along with the tasks which the worker can perform. This module also hold the database related factory which in a way is designed to be agnostic of the underlying database and can be switched quite easily with any other SQL database. The worker here is using celery the as the medium for processing tasks asyncronously and uses rabbitmq as the message broker.
4. Client - This module contains both the tester script to test the database functionality along with barebone flask application which can be hosted in numbers across the environment as the everything is built using docker containers. The flask app connects to the rmq broker and accepts the http request for the database operations to send them to the worker to perform the different requested tasks.

* How would you run this in production? Include details of the technical stack where relevant.
> Running the application in production will be much simpler due to the containerized implementation of the architure and application. What can be done from here on is first going by the route of keeping this application serverless. 
>Then adding the IaaC to the application for the deployment in cloud infra of choice which again can be kept across multiple enviroment.
> Then a deployment of the application needs to be done using some CI CD platform ensuring the health checks of the each service before the deployment.
> What also will be a good thing to do here is making the repo monorepo. Also the test bench needs to be added before actually taking this to production. 
> Next upon actually going to production we can improve the applications components like rabbitmq and postgresql by creating clusters of the them to make them fail safe. The way the current implementation is it will be easy to segregate those task quite easily and taking them to production. 
> A Service discovery environment can also be setup so that instead of keep the config in the module, module will take the responsibilty to figuring out and find the dependent components and connecting to them.

## Technologies Used
- Python
- Celery
- RabbitMQ
- PostgresSQL
- Docker
- Flask

## Description

This is basic application which let's perform database operations asyncronously by making a rest call to the the client and the data is stored in the database i.e. postgresSQL.
The database ensures some of the conditions are satisfied before actually making the insert/update actions. The table design of the database is as follows:

**Continent**

id | name | area | population 
--- | --- | --- | --- |---
integer(pk) | varchar | integer | bigint

**Country**

id | name | area | population | hospital_count | national_park_count | continent_id
--- | --- | --- | --- |--- | --- | --- 
integer(pk) | varchar | integer | bigint | integer | integer | integer(fk)

**City**

id | name | area | population | roads_count | trees_count | country_id
--- | --- | --- | --- |--- | --- | --- 
uuid(pk) | varchar | integer | bigint | integer | integer | integer(fk)

The RabbitMQ which is being used as message broker has an exchange named *events* which is used as topic to publish events. Now there is queue named *database_events* from which the consumer consumes the events to perform tasks on. The binding for the queue is with the *events* exchange on routing key as *db.*.worker* where * is wild card replacing the type of event like create, update, delete.

The worker uses celery to consume events from the message broker to perform the tasks which are called for asyncronously.
The client sends the task on the API request to the broker using celery which connects to the message broker to publish the events.
## Running and building
```
docker-compose build
docker-compose up
```
## Testing
```
- Go to your favourite REST client.
- Also first you can test if the client application is up and running by just making a GET request on:
URL: http://localhost:5100/

- Make sure you select the content type as application/json.
- To create any record of type e.g. country, city, continent, just make a POST call with the following body
URL: http://localhost:5100/
POST BODY: 
{
    "entity": "country",
    "data": {
        "id": 125,
        "continent_id": 1,
        "name": "New Nation",
        "population": 200,
        "area": 200,
        "hospital_count": 200,
        "national_park_count": 200
    }
}

- To update any record of type e.g. country, city, continent, just make a PUT call with the following body
URL: http://localhost:5100/
PUT BODY:
{
    "entity": "country",
    "data": {
        "area": 1000
    },
    "query": {
        "id": 125
    }
}

- And finally to delete any record of type e.g. country, city, continent, make a DELETE call with the following body
URL: http://localhost:5100/
DELETE BODY:
{
    "entity": "country",
    "query": {
        "id": 125
    }
}
```

## Known Bugs/Future Implementations

* _The application only performs barebone database related operations_
* _The tasks are not currently loaded dynamically. Celery to provide the automatically loading the task in the project directory but that is not being taken care of right now_
* _The database setup script might now sometimes import the dummy data properly but upon going inside the docker and running them things just execute fine_
* _Proper health check between and the services is not take care of properly right now. It can be done in a better manner_

And finally ***I did enjoy it!!!*** :+1: Next step... ***TO THE PRODUCTION*** :ghost: