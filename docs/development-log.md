

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

## **Session 3: Testing on Windows**  
- Switched to a Windows machine to see if the issue is platform-specific.  
- Continuing to debug and compare results between macOS and Windows.   
- Encountered: **"WSL2 is not supported with the current machine configuration."**  
- Decided to try a virtual machine instead.  
- **Installed VirtualBox and Ubuntu** to create an isolated environment for Docker testing.  
- Named VM: **Ubuntu Docker Test**, running on **Linux 64-bit**.  
- Allocated **4GB RAM and 2 CPUs** to maintain efficiency.  
- **Issue:** Navigating Ubuntu was too cumbersome for the project’s focus.  
- **Decision:** Move away from VirtualBox and consider **Colima** or **Rancher** as alternatives.  

## **Session 3.5: Switching to Colima**  
- Chose **Colima** over VirtualBox for a streamlined Docker setup on macOS.  
- Installed Colima via Homebrew:  
  ```sh
  brew install colima  
  brew services start colima  
  ```
- Configured **Docker to run through Colima** but faced **restricted permissions issues** with the Docker Daemon.  
- Fixed the permission issue by updating socket permissions.  
- Changed **Colima context** and ran `docker info` to confirm setup.  
- **Still encountering:**  
  - `ImportError: attempted relative import with no known parent package`  
  - **Confirmed the issue is with the application code, not the environment.**  
- Adjusted `__init__.py` and `routes.py`, which finally resolved the error.  

## **Session 4: Debugging Container Issues**  
- The container **started but immediately exited** (`Exited(0)` and `Exited(1)`).  
- Ran `python __init__.py` inside the container – **no visible errors**.  
- **Modified `__init__.py` to run on `0.0.0.0`** → Successfully accessed the app, but encountered **404 errors**.  
- Created a **new directory** `flask-web-app-reset` and copied:  
  - `Dockerfile`  
  - `requirements.txt`  
  - `app/` folder  
- Switched Dockerfile base image to **Python 3.9 Slim Buster** to avoid compatibility issues.  

### **Solutions Found:**  
1. **Used Ubuntu as the base image** → Resolved Python base image inconsistencies.  
2. **Added `--break-system-packages` flag** → Fixed pip3 installation errors on Ubuntu.  
3. **Set `host='0.0.0.0'` in `simple_app.py`** → Allowed Flask to listen on all network interfaces within the container.  

## **Session 5: Applying Fixes to the Main Web App**  
- Now that the reset version is working, applying the same changes to the **original web app** repository.  






