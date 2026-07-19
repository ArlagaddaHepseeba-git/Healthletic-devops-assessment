# 🚀 Healthletic DevOps Assessment

## Overview

This project builds an automated pipeline that takes a Flask backend application from code to a live deployment, using GitHub Actions, Docker, Docker Hub, AWS EC2, Kubernetes, and Helm.
Whenever new code is pushed, the pipeline automatically: builds a Docker image, checks it for security vulnerabilities, uploads it to Docker Hub, deploys it to Kubernetes using Helm, runs tests to make sure it's working, and rolls back to the last working version if anything fails.


---

# Project Objectives

- Automate application build and deployment
- Containerize the Flask application
- Push Docker images to Docker Hub
- Perform image security scanning
- Deploy application using Helm
- Execute smoke tests after deployment
- Roll back automatically on deployment failure
- Support manual deployments using a shell script

---

# Tech Stack

| Technology | Purpose |
|------------|---------|
| Python Flask | Backend API |
| Docker | Containerization |
| Docker Hub | Container Registry |
| GitHub Actions | CI/CD Pipeline |
| Trivy | Image Vulnerability Scanning |
| Kubernetes | Container Orchestration |
| Helm | Kubernetes Package Manager |
| AWS EC2 | Deployment Environment |
| Bash | Deployment Automation |

---

# Project Structure

```
healthletic-flask-api/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── Dockerfile
├── deploy.sh
├── app.py
├── requirements.txt
├── README.md
└── DEPLOYMENT_GUIDE.md
```

---

# Solution Architecture

## Architecture Diagram
<img width="1722" height="831" alt="image" src="https://github.com/user-attachments/assets/4aabaef7-2acb-452e-95c3-719648713cac" />

---

# CI/CD Workflow

The GitHub Actions workflow performs the following stages:

1. Trigger on Push or Pull Request
2. Checkout Repository
3. Build Docker Image
4. Scan Docker Image using Trivy
5. Push Image to Docker Hub
6. Deploy Application using Helm
7. Run Smoke Tests
8. Rollback Automatically if Smoke Tests Fail

---

# Docker Image

Repository

```
hepseeba/healthletic-flask-api
```

Tag

```
v1.0.0
```

Build Image

```bash
docker build -t hepseeba/healthletic-flask-api:v1.0.0 .
```

Push Image

```bash
docker push hepseeba/healthletic-flask-api:v1.0.0
```

Pull Image

```bash
docker pull hepseeba/healthletic-flask-api:v1.0.0
```

Run Container

```bash
docker run -itd --name healthletic-flask-api -p 5000:5000 hepseeba/healthletic-flask-api:v1.0.0
```

---

The script performs

- Parameter Validation
- Deployment using Helm
- Logging
- Error Handling
- Rollback
- Cleanup

---

# Deployment Verification

Check Running Containers

```bash
docker ps
```

Application Logs

```bash
docker logs healthletic-flask-api
```

Health Check

```bash
http://65.2.167.0:5000
```

Browser

```
http://65.2.167.0:5000
```

Expected Response

```json
{
  "message": "Welcome to Healthletic DevOps Assessment"
}
```

---
## AWS EC2 Instance

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/69f0ea5a-8728-4cc4-b345-8818080f3361" />

---

## Docker Image Build
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9ec315bf-bc96-4033-85f8-cb960db48a2d" />

---
## Docker Pull on EC2

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/07a76c5f-6197-4cd4-8b38-fb7ae6da4d90" />

---

## GitHub Repository

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d3418dbe-d461-41a8-9ac4-bd4699dc293c" />


---

## GitHub Actions Workflow Success

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5638a241-c888-4d9b-9b7b-a496461bfcbc" />


---

## Application Running in Browser

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/08999b10-a218-41fa-b93f-1448d3ec7be1" />


---

## Smoke Test Output

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ed8f4f9c-0652-41c0-8fc2-378d9c83b9ba" />

---
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/634e085f-9f75-4972-ade0-75babac6c212" />

---


# Deliverables

- Dockerfile
- deploy.sh
- GitHub Actions Workflow
- DEPLOYMENT_GUIDE.md
- README.md
---

# Author 

**Hepseeba Arlagadda**

AWS DevOps Engineer
GitHub Repository:

https://github.com/ArlagaddaHepseeba-git/healthletic-flask-api

Docker Hub:

https://hub.docker.com/hepseeba/healthletic-flask-api

---

