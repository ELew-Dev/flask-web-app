from flask import Flask

# Initialize the Flask app
app = Flask(__name__)

import routes

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)