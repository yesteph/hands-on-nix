from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    print "I'm a Python 2 app"
    return "Hello Devoxx! I'm Bobby, a Python 2 app"