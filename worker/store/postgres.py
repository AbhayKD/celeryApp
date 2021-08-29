import psycopg2
from utils.config import config

class DB():
    def __init__(self):
        connection = None

    def connect(self):
        """ Connect to the PostgreSQL database server """
        try:
            # read connection parameters
            params = config("infraconfig.ini", "POSTGRES_SQL_DB")

            # connect to the PostgreSQL server
            print('Connecting to the PostgreSQL database...')
            # self.connection = await asyncpg.connect(**params)
            self.connection = psycopg2.connect(**params)
            self.cursor = self.connection.cursor()
            print('DB connected')
        except Exception as ex:
            print(ex)
            raise ex

    def disconnect(self):
        self.connection.close()
        print('Database connection closed.')

    def execute(self, query):
        try:
            self.cursor.execute(query)
            self.connection.commit()
        except Exception as ex:
            self.cursor.execute("rollback;")
            self.connection.commit()
            raise ex