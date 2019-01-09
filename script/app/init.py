from flask import Flask
import datetime
app = Flask(__name__)

@app.route('/')
def index():
    return "<h1>Hello, World!</h1>"

@app.route('/version')
def version():
    now = datetime.datetime.now()
    return "Version: 0.0.1 <br> Time: {0}".format(now)

@app.route('/user/<name>')
def user(name):
	return '<h1>Hello, {0}!</h1>'.format(name)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0', port= 5000)