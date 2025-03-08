from app import app
from flask import render_template

# Route for the homepage
@app.route('/')
def index():
    return render_template('index.html')  # Render the 'index.html' template

# Route for the 'about' page
@app.route('/about')
def about():
    return render_template('about.html')  # Render the 'about.html' template
