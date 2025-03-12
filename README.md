# Flask Web App Deployment on Google Kubernetes Engine (GKE)

## Overview

This project is a simple Flask web application containerized using Docker and deployed on Google Kubernetes Engine (GKE). Initially, the project aimed for deployment on OpenShift, but due to trial limitations and troubleshooting challenges, it was transitioned to GKE. This document details the process, challenges, and solutions encountered during the deployment.

## Features

* Built with Flask (Python web framework)
* Containerized with Docker
* Deployed on Google Kubernetes Engine (GKE)
* Supports local development with Docker

## Getting Started

### Prerequisites

Ensure you have the following installed:

* Python 3.9+
* Docker
* Google Cloud SDK (gcloud)
* kubectl (Kubernetes command-line tool)

### Setup and Running Locally

1.  Clone the repository:

    ```bash
    git clone [https://github.com/ELew-Dev/flask-web-app.git](https://github.com/ELew-Dev/flask-web-app.git)
    cd flask-web-app
    ```

2.  Build the Docker image:

    ```bash
    docker build -t flask-web-app .
    ```

3.  Run the container:

    ```bash
    docker run -p 5000:5000 flask-web-app
    ```

4.  Open your browser and go to: `http://localhost:5000`

### Deployment to Google Kubernetes Engine (GKE)

1.  **Create a GKE Cluster:**
    * In the Google Cloud Console, navigate to Kubernetes Engine and create a GKE Autopilot cluster.

2.  **Authenticate Docker with GCP:**

    ```bash
    gcloud auth configure-docker
    ```

3.  **Build and Push the Docker Image:**

    ```bash
    docker build -t gcr.io/YOUR_PROJECT_ID/flask-web-app .
    docker push gcr.io/YOUR_PROJECT_ID/flask-web-app
    ```

    * Replace `YOUR_PROJECT_ID` with your Google Cloud Project ID.

4.  **Configure Kubernetes Manifests:**
    * Ensure you have `deployment.yaml` and `service.yaml` files.
    * Update the `deployment.yaml` file with the correct image path (`gcr.io/YOUR_PROJECT_ID/flask-web-app`).

5.  **Deploy the Application:**

    ```bash
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    ```

6.  **Expose the Application:**
    * The `service.yaml` uses a LoadBalancer, which will provide an external IP.
    * Get the external IP:

        ```bash
        kubectl get service flask-app-service
        ```

    * Access the application in your browser using the external IP.

## Development Log

**(Include the entire detailed development log you provided here)**

## Cleanup

To avoid incurring costs:

1.  Delete the GKE cluster.
2.  Delete the Docker image from Google Cloud Registry (GCR) or Artifact Registry.
3.  Consider deleting the Google Cloud Project if it is no longer needed.

## Next Steps (Potential Enhancements)

* Implement authentication.
* Add database support.
* Improve error handling.
* Set up CI/CD pipeline.
* Configure HTTPS.
* Add a custom domain.

## Key Takeaways

* Google Cloud Platform (GCP) has its own authentication and authorization mechanisms.
* Managing the PATH environment variable is crucial for GCP CLI tools.
* GKE Autopilot simplifies cluster management but has unique behaviors.
* Google Cloud-specific commands are necessary for authentication, deployment, and image storage.
* Artifact Registry is the newer method for storing Docker images on GCP.
