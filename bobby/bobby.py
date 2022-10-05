#!/usr/bin/env python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    print("I'm a Python 3.9 app")
    return "Hello Devfest! I'm Bobby, a Python 3.9 app"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
