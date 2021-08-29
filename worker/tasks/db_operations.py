from utils.config import config
from store.factory import QueryBuilder
from app import app as celery_app, db

factory_builder = QueryBuilder()

@celery_app.task(bind=True, max_retries=3, serializer='json', name="db_operation_insert")
def insert(self, entity, records):
    try:
        entity_type = type(entity)
        records_type = type(records)
        if entity_type is str and (records_type is dict or records_type is list):
            query = factory_builder.create(entity, records)
            if query:
                db.execute(query.get_sql())
            else:
                print(f'No query formed for {entity}. Ignoring the request!!!')
    except Exception as ex:
        self.retry(exc=ex, countdown=10)

@celery_app.task(bind=True, max_retries=3, serializer='json', name="db_operation_update")
def update(self, entity, query, update_obj):
    try:
        query = factory_builder.update(entity, query, update_obj)
        if query:
            db.execute(query.get_sql())
        else:
            print(f'No query formed for {entity}. Ignoring the request!!!')
    except Exception as ex:
        self.retry(exc=ex, countdown=10)

@celery_app.task(bind=True, max_retries=3, serializer='json', name="db_operation_delete")
def delete(self, entity, query):
    try:
        query = factory_builder.delete(entity, query)
        if query:
            db.execute(query.get_sql())
        else:
            print(f'No query formed for {entity}. Ignoring the request!!!')
    except Exception as ex:
        self.retry(exc=ex, countdown=10)