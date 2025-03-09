# Use the official Python 3.9 image as the base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt into the container so I can install the dependencies
COPY requirements.txt /app/

# Install all the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's code into the container
COPY . /app/

# Expose port 5000 because Flask runs on it by default
EXPOSE 5000

# Tell Docker to run the app when the container starts
CMD ["python", "app.py"]
