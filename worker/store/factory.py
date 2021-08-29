# file will contain all the crud operations required to perform with postgresql
from pypika import Query, Table, Field

class QueryBuilder:
    def __init__(self):
        pass

    def get(self, query, entity):
        pass
    
    def create(self, entity, records):
        table_entity = Table(entity)
        columns = tuple()
        data = []
        if type(records) is list:
            columns = tuple(records[0].keys())
            data = list(tuple(i.values()) for i in records)
        else:
            columns = tuple(records.keys())
            data = tuple(records.values())
        query = Query.into(table_entity).columns(columns).insert(data)
        return query

    '''
    For now this method only handles updates on the equality conditions
    e.g. id == 123 | country == 'New country'
    '''
    def update(self, entity, conditions, update_obj):
        table_entity = Table(entity)
        query = Query.update(table_entity)
        if len(update_obj.keys()) > 0:
            for key, value in update_obj.items():
                query = query.set(table_entity[key],value)
            if len(conditions.keys()) > 0:
                for key, value in conditions.items():
                    query = query.where(table_entity[key] == value)
                return query
            else:
                print("No conditional statements found for the update")
        else:
            print("Nothing found in the update obj")

    '''
    For now this method only handles updates on the id equality conditions.
    This is being done only due to brevity of time. Can for sure extended
    to the levels of conditional statements also.
    e.g. id == 123 
    '''
    def delete(self, entity, conditions):
        table_entity = Table(entity)
        query = Query.from_(table_entity).delete()
        if "id" in conditions:
            query = query.where(table_entity.id == conditions["id"])
            return query
        else:
            print("No id found in the query")
    