from celery import Celery
from flask import Flask
from flask_restful import Resource, Api, reqparse
from utils.config import config

params = config("infraconfig.ini", "CELERY_CLIENT_CONFIG")
app = Flask(__name__)
api = Api(app)
# we can dynamically load all the tasks name here from the task module. Keeping hard coded for now
celery_client = Celery(broker=params['broker_url'])

class Client():
    def insert(self):
        entity = "country"
        message = {
            "id": 125,
            "continent_id": 1,
            "name": "New Nation",
            "population": 200,
            "area": 200,
            "hospital_count": 200,
            "national_park_count": 200,
        }
        result = celery_client.send_task('db_operation_insert', (entity, message), exchange="events", routing_key="db.create.worker")
        # insert.apply_async((entity,message), exchange="events", routing_key="db.create.worker")
    
    def update(self):
        entity = "country"
        query = { "id": 125 }
        update_obj = { "area": 2000000 }
        celery_client.send_task('db_operation_update', (entity, query, update_obj), exchange="events", routing_key="db.update.worker")
        # update.apply_async((entity, query, update_obj), exchange="events", routing_key="db.update.worker")

    def delete(self):
        entity = "country"
        query = {
            "id": 125
        }
        celery_client.send_task('db_operation_delete', (entity, query), exchange="events", routing_key="db.delete.worker")
        # delete.apply_async((entity, query), exchange="events", routing_key="db.delete.worker")

if __name__ == '__main__':
    client = Client()
    client.insert()
    client.update()
    client.delete()
