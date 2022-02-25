from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    print("I'm a Python 3 app")
    return "Hello Devoxx! I'm Charlie, a Python 3 app"