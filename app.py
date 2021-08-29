from celery import Celery
from flask import Flask
from flask_restful import Resource, Api, reqparse
from utils.config import config

params = config("infraconfig.ini", "CELERY_CLIENT_CONFIG")
app = Flask(__name__)
api = Api(app)
# we can dynamically load all the tasks name here from the task module. Keeping hard coded for now
celery_client = Celery(broker=params['broker_url'])

class Backend(Resource):
    def get(self):
        try:
            return "Healthy & Ready", 200
        except Exception as ex:
            return ex, 400
    def post(self):
        try:
            parser = reqparse.RequestParser()
            parser.add_argument('entity', type=str)
            parser.add_argument('data', type=dict)
            args = parser.parse_args() 
            if args['entity'] is not None and args['data'] is not None:
                # insert.apply_async((args["entity"],args["data"]), exchange="events", routing_key="db.create.worker")
                celery_client.send_task('db_operation_insert', (args["entity"],args["data"]), exchange="events", routing_key="db.create.worker"),200
            else:
                print("Incomplete request")
            return "DONE", 200
        except Exception as ex:
            return ex, 400
    def put(self):
        try:
            parser = reqparse.RequestParser() 
            parser.add_argument('entity', type=str)
            parser.add_argument('data', type=dict)
            parser.add_argument('query', type=dict) 
            args = parser.parse_args() 
            if args['entity'] is not None and args['data'] is not None and args['query'] is not None:
                # update.apply_async((args["entity"], args['query'], args['data']), exchange="events", routing_key="db.update.worker")
                celery_client.send_task('db_operation_update', (args["entity"], args['query'], args["data"]), exchange="events", routing_key="db.update.worker"), 200
            else:
                print("Incomplete request")
            return "DONE", 200
        except Exception as ex:
            return ex, 400
    def delete(self):
        try:
            parser = reqparse.RequestParser()
            parser.add_argument('entity', type=str)
            parser.add_argument('query', type=dict)
            args = parser.parse_args() 
            if args['entity'] is not None and args['query'] is not None:
                # delete.apply_async((args['entity'], args['query']), exchange="events", routing_key="db.delete.worker")
                celery_client.send_task('db_operation_delete', (args["entity"], args['query']), exchange="events", routing_key="db.delete.worker")
            else:
                print("Incomplete request")
            return "DONE", 200
        except Exception as ex:
            return ex, 400

api.add_resource(Backend, '/') 

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)

