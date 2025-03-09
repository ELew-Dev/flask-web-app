# Use the official Python 3.9 image as the base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt /app/

# Install all the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the 'app' folder (not just files) into the container
COPY app /app/

# Expose port 5000 because Flask runs on it by default
EXPOSE 5000

# Tell Docker to run the app when the container starts
CMD ["python", "-m", "app"]

