

# **Flask Web App - Development Log**  

## **Session 1: Initial Setup**  
- Set up the folder structure based on anticipated needs.  
- Since this is my first time working with OpenShift, Docker, and [another tool], I wasn’t exactly sure what to plan for, so I made adjustments along the way.  

## **Session 1.5: Learning & Best Practices**  
- Need to better understand GitHub best practices and working with containers.  
- Managing multiple open containers is challenging as a beginner.  
- As the project scales, organization will be critical to handling the growing number of files efficiently.  

## **Session 2: Troubleshooting Docker & GitHub Integration**  
### **Dockerfile Errors & Debugging**  
- Encountered errors with the `Dockerfile`, initially suspecting sync issues between Git and GitHub.  
- Modified the script to run Docker using:  
  ```dockerfile
  CMD app/__init__.py
  ```  
  instead of `app.py`—but this wasn’t the issue.  
- Kept running into:  
  ```bash
  ModuleNotFoundError: No module named 'app'
  ```  
- Tried multiple builds without success. Needed to research Docker image creation and whether failed image builds were still being stored.  
- Discovered the issue wasn’t the file locations (`Dockerfile` in root and `__init__.py` in `app/`) but how the code was structured.  

### **Debugging the ImportError**  
- Still encountering `ModuleNotFoundError: No module named 'app'`.  
- Double-checked:  
  - File structure  
  - `routes.py`  
  - `__init__.py`  
  - `Dockerfile`  
- Attempted to run `__init__.py` directly inside the container to isolate import errors and verify the package structure.  

#### **Findings:**  
- Running `__init__.py` manually confirmed that the file was being executed inside the Docker container.  
- However, encountered:  
  ```bash
  ImportError: attempted relative import with no known parent package
  ```  

### **Docker Logging Issues**  
- Initially ran:  
  ```bash
  docker logs <container_id>
  ```  
  incorrectly.  
- Realized I needed to first retrieve the container ID using:  
  ```bash
  docker ps
  ```  
  in a separate terminal before running:  
  ```bash
  docker logs <container_id>
  ```  
- Fixing this should allow proper execution and image creation.  

## **Session 2.5: Investigating Python Package Handling**  
- Suspected an issue with how Python was handling package structures locally (macOS).  
- Further research showed no issues with the local Python environment, so the problem might be how Docker is managing the package.  
- Discovered that running:  
  ```bash
  cat __init__.py
  ```  
  and  
  ```bash
  cat routes.py
  ```  
  together was concatenating the outputs—possibly affecting execution.  
- Testing file execution separately to verify.  

### **Next Steps:**  
- Creating an isolated test project to debug the issue.  
- Testing on a backup computer.  

## **Session 3: Testing on Windows**  
- Switched to a Windows machine to see if the issue is platform-specific.  
- Continuing to debug and compare results between macOS and Windows.  

