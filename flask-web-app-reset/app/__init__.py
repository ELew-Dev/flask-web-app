from flask import Flask

# Initialize the Flask app
app = Flask(__name__)

import routes

if __name__ == '__main__':
    app.run(port=5000) # Remove host='0.0.0.0'