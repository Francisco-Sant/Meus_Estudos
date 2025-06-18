from flask import flask
from redis import redis
from multiprocessing import Process
import signal, os

host_redis=os.environ.get('HOST_REDIS', 'redis')
port_redis=os.environ.get('PORT_REDIS', '6379')

app = Flask(__name__)
redis = Redis(host=host_redis, port=port_redis)

@app.route('/')
def hello():
    redis.incr('hits')
    return 'Hello World! %s times.' % (socket.gethostname(), redis.get('hits')

if __name__ == "__main__":
    def server_handler(signum, frame):
        print ('Signal handler called with signal', signum)

        server.terminate()
        server.join()

    signal.signal(signal.SIGTERM, server_handler)

    def run_server():
        app.run(host="0.0.0.0", debug=True)

    server = Process(target=run_server)
    server.start()    
    