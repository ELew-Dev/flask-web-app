# Use the official Python 3.9 slim image as the base
FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt /app/

# Install all the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the contents of the 'app' folder into the container's /app directory
COPY app/ .

# Expose port 5000 because Flask runs on it by default
EXPOSE 5000

# Set the entry point to run your Flask application
CMD ["python", "__init__.py"]
