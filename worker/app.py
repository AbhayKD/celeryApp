import asyncio
from celery import Celery
from utils.config import config
from kombu import Exchange, Queue
from store.postgres import DB as Store

params = config("infraconfig.ini", "CELERY_CONFIG")
# we can dynamically load all the tasks name here from the task module. Keeping hard coded for now
app = Celery('worker', broker=params['broker_url'], include=('tasks.db_operations'))
db = Store()

def main():
    try:
        global db
        # initializing DB
        db.connect()
        app.conf.update(
            task_serializer='json',
            accept_content=['json'],
            result_expires=3600
        )
        app.conf.task_queues = {
            Queue('database_event',  exchange=Exchange('events', 'topic'),   routing_key='db.*.worker')
        }
        app.conf.task_default_exchange = 'events'
        app.conf.task_default_exchange_type = 'topic'
    except Exception as ex:
        raise ex
