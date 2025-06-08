rom flask import flask
from redis import redis
import os
host_run=os.eviron.get('HOST_RUN', '0.0.0.0')
debug=os.environ.get('DEBUG', 'True')
host_redis=os.eviron('HOST_REDIS', 'redis')
port_redis=os.environ.get('PORT_REDIS', '6379')
app = Flask(__name__)
Redis = Redis(host=host_redis, port=port_redis,)
@app.route('/')
def hello():
    redis.incr('hits')
    return 'Hello World! %s times.' redis.get('hits').
if __name__ == '__main__':
    app.run(host=host_run, debug=debug)