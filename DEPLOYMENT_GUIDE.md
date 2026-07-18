# Healthletic DevOps Deployment Guide

## Overview

This project automates the build, security scanning, containerization, and deployment of the Healthletic Flask API using GitHub Actions, Docker, Docker Hub, Helm, and Kubernetes.

---

## Prerequisites

- Git
- Docker
- Docker Hub Account
- Kubernetes Cluster (Minikube/EKS)
- Helm 3
- kubectl
- Python 3.11

---

## GitHub Secrets

Configure the following secrets in your GitHub repository:

| Secret | Description |
|----------|-------------|
| DOCKER_USERNAME | Docker Hub Username |
| DOCKER_PASSWORD | Docker Hub Personal Access Token |

---

## GitHub Actions Workflow

The workflow performs the following:

1. Checkout source code
2. Install Python dependencies
3. Validate the Flask application
4. Login to Docker Hub
5. Build Docker Image
6. Push Docker Image
7. Run Trivy Security Scan
8. Helm Lint
9. Helm Template Validation
10. Deploy using Helm
11. Execute Smoke Tests
12. Rollback if deployment fails

---

## Docker Image

Example:

```
hepseeba/healthletic-flask-api:v1.0.0
```

Pull the image:

```bash
docker pull hepseeba/healthletic-flask-api:v1.0.0
```

Run the container:

```bash
docker run -d -p 5000:5000 hepseeba/healthletic-flask-api:v1.0.0
```

---

## Manual Deployment

Run:

```bash
./deploy.sh dev v1.0.0 hepseeba/healthletic-flask-api
```

Parameters:

- environment
- version
- image_registry

Example:

```bash
./deploy.sh prod v1.0.0 hepseeba/healthletic-flask-api
```

---

## Troubleshooting

### Docker Login Failed

Verify:

- DOCKER_USERNAME
- DOCKER_PASSWORD

are configured in GitHub Secrets.

---

### Helm Deployment Failed

Verify:

```bash
kubectl get pods
helm list
```

---

### Image Push Failed

Verify:

- Docker Hub credentials
- Repository name
- Network connectivity

---

## Rollback

Rollback to the previous release:

```bash
helm rollback backend
```

---

## Logs

Deployment logs are stored in:

```
deployment.log
```

---

## Author

Hepseeba Arlagadda
## Deployment Note

This project demonstrates the complete CI/CD workflow required for the assessment.

The workflow successfully:
- Builds the Flask application
- Creates a Docker image
- Pushes the image to Docker Hub
- Performs Trivy vulnerability scanning
- Validates the Helm chart using Helm Lint and Helm Template

The deployment, smoke test, and rollback stages are simulated because a Kubernetes cluster was not provided as part of the assessment environment.

In a production environment, these steps would be replaced with:

```bash
helm upgrade --install backend flask-api --wait
kubectl rollout status deployment/backend
curl http://<service>/health
helm rollback backend
```

The workflow structure is designed so these commands can be enabled once a Kubernetes cluster and credentials are available.
