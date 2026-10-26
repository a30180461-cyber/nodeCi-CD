# From the Other Side

This repository demonstrates a lightweight Node.js application packaged and validated through a modern DevOps workflow. While the app itself is a simple paranormal sightings site, the primary emphasis of this project is on containerization, Kubernetes deployment, and CI/CD automation.

## DevOps Focus

This project is designed to showcase a practical pipeline from source code to a running containerized service in a Kubernetes environment. The app acts as a sample workload, while the real purpose is to demonstrate:

- Docker image creation
- local container execution
- Helm-based deployment
- Kubernetes rollout validation
- GitHub Actions-driven automation

## Project Overview

The application lives in the `app/` directory and is a small custom Node.js web service used to collect and display paranormal sightings. It includes:

- static pages for the frontend
- a JSON API for creating and reading sightings
- data persistence in a local JSON file
- input sanitization before storage
- Server-Sent Events for a live news feed



## Architecture

```text
GitHub Repository
    |
    v
GitHub Actions Workflow
    |
    +--> Install dependencies
    +--> Build Docker image
    +--> Load image into kind cluster
    +--> Deploy with Helm
    +--> Validate rollout with kubectl
    v
Kubernetes Cluster
    |
    v
Containerized Node.js app
```

## Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── ci.yml
├── app/
│   ├── Dockerfile
│   ├── README.md
│   ├── package.json
│   ├── server.js
│   ├── data/
│   ├── events/
│   ├── handlers/
│   ├── public/
│   └── utils/
├── helm/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── charts/
│   └── templates/
├── README.md
├── .gitignore
└── .dockerignore
```

## Local and Deployment Steps

### 1. Local development

```bash
cd app
npm install
npm start
```

Open the app in the browser:

```text
http://localhost:8000
```

### 2. Build the Docker image

```bash
docker build -t node-app ./app
```

### 3. Run the container locally

```bash
docker run -p 8000:8000 node-app
```

### 4. Deploy with Helm

```bash
helm upgrade --install samplenode-app ./helm
```

## GitHub Actions CI/CD Pipeline

The continuous integration workflow is configured in `.github/workflows/ci.yml` and runs automatically on push.

### Pipeline steps

1. Check out the repository code.
2. Set up Node.js.
3. Create a Kubernetes cluster using `kind`.
4. Install app dependencies with `npm ci`.
5. Build the Docker image.
6. Load the Docker image into the cluster.
7. Deploy the app with Helm.
8. Wait for rollout completion using `kubectl rollout status`.
9. Verify the running pods.

### Pipeline flow

```text
GitHub push
  -> checkout repo
  -> setup Node.js
  -> create kind cluster
  -> npm ci
  -> docker build
  -> kind load docker-image
  -> helm upgrade --install
  -> kubectl rollout status
  -> kubectl get pods
```


