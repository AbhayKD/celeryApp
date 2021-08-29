# '''
# So, we will a json object from the client 
# parse the json first.
# {
#     action: CREATE | UPDATE| DELETE
#     record: {}
# }
# '''

import asyncio
from utils.config import config
from app import main, app as celery_app

params = config("infraconfig.ini", "CELERY_CONFIG")


def run():
    print('Setting up the worker')
    main()
    worker_config = {
        "concurrency" : int(params['concurrency']) or 1,
        "pool" : params['pool'] or None,
        "loglevel" : params['loglevel'] or 'debug',
        "queues": params["queue"]
        # "exchange": "events",
        # "routing_key": "db.*.worker"
    }
    worker = celery_app.Worker(**worker_config)
    # worker.setup_instance(queues= params["queue"])
    print('Starting up the Celery tasks...')
    worker.start()

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.create_task(run())
    loop.run_forever()