# **Flask Web App with Docker & OpenShift**  

## **Overview**  
This project is a simple Flask web application containerized using Docker and deployed on OpenShift. The goal is to create a scalable and portable web app while learning how to manage containerized applications.  

## **Features**  
- Built with **Flask** (Python web framework)  
- Containerized with **Docker**  
- Deployed on **OpenShift**  
- Supports local development with **Colima** or **Docker Desktop**  

## **Getting Started**  

### **Prerequisites**  
Ensure you have the following installed:  
- **Python 3.9+**  
- **Docker** (or Colima)  
- **OpenShift CLI (oc)** (if deploying to OpenShift)  

### **Setup and Running Locally**  
1. Clone the repository:  
   ```sh
   git clone https://github.com/ELew-Dev/flask-web-app.git  
   cd flask-web-app  
   ```  
2. Build the Docker image:  
   ```sh
   docker build -t flask-web-app .  
   ```  
3. Run the container:  
   ```sh
   docker run -p 5000:5000 flask-web-app  
   ```  
4. Open your browser and go to:  
   ```
   http://localhost:5000  
   ```  

### **Deploying to OpenShift**  
1. Login to OpenShift:  
   ```sh
   oc login --token=YOUR_TOKEN --server=YOUR_SERVER  
   ```  
2. Deploy the application:  
   ```sh
   oc new-app flask-web-app --name=my-flask-app  
   oc expose svc/my-flask-app  
   ```  
3. Get the public URL:  
   ```sh
   oc get route my-flask-app  
   ```  

## **Development Log**  
For troubleshooting steps and progress updates, see [development-log.md](docs/development-log.md).  

## **Next Steps**  
- Implement authentication  
- Add database support  
- Improve error handling  
