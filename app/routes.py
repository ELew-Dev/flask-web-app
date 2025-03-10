from flask import render_template
from . import app

# Route for the homepage
@app.route('/')
def index():
    return render_template('index.html')

# Route for the 'about' page
@app.route('/about')
def about():
    return render_template('about.html')