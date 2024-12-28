### 1. Logesh Pro1 CI/CD with Docker
This project demonstrates setting up a CI/CD pipeline using Jenkins, Docker, and GitHub, along with Prometheus and Grafana for container monitoring.

### 2. Table of Contents
Overview
Prerequisites
Setup
Jenkins Pipeline
Docker Configuration
Monitoring with Prometheus & Grafana
Repository Structure
Usage
Contributing
License
Overview
This project aims to deploy a simple website using Apache HTTP Server in Docker. The application is built through a CI/CD pipeline powered by Jenkins. Docker containers are used for the web server and monitoring purposes, and Prometheus and Grafana are set up for tracking container performance.

### 3. Prerequisites
* Git: Source Code Manager
* Docker: Installed on the host machine.
* Docker Compose: Used for multi-container management.
* Jenkins: Used for automating the CI/CD pipeline.
* Prometheus & Grafana: Used for monitoring and visualizing container metrics.

### 4. Setup
1. Install Docker and Docker Compose
If Docker and Docker Compose are not yet installed, you can follow the official documentation:
Docker: https://docs.docker.com/get-docker/
Docker Compose: https://docs.docker.com/compose/install/

### 2. Set up Jenkins
Install Jenkins on your host machine. Follow the installation guide from Jenkins Official Docs.
Set up your Jenkins pipeline to connect to your GitHub repository.

### 3. Monitoring with Prometheus & Grafana
* Prometheus collects metrics from Docker containers and exposes them via a web interface.
* Grafana visualizes these metrics, providing insights into container health and performance.
* You can access Prometheus at http://<host-ip>:9090 and Grafana at http://<host-ip>:3000 to view metrics.

### 5. Jenkins Pipeline
The pipeline uses the Jenkinsfile located in the root of the repository. It:

### 6. Clones the repository from GitHub.
* Builds the Docker image using the Dockerfile.
* Deploys the container with the latest changes.
* Notifies the user on the build status.

### 7. Docker Configuration
The Docker setup consists of multiple containers:

### 8. Web server (Apache HTTPD): The main application runs inside an Apache HTTP Server container.
* Prometheus: Collects container metrics.
* Grafana: Visualizes Prometheus metrics.
* The Docker setup is defined in the docker-compose.yml file, which runs all the containers required for the project.

### 9. yaml

version: '3.3'

services:
  web:
    build: .  # Build the image using the Dockerfile in the current directory
    ports:
      - "80:80"  # Map container's port 80 to host's port 80
    restart: always

  prometheus:
    image: prom/prometheus
    container_name: prometheus
    ports:
      - "9090:9090"  # Prometheus UI
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - "3000:3000"  # Grafana UI
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin

### 10. Repository Structure
logesh-pro1/
├── css/
├── images/
├── js/
├── newsite/
│   ├── index.html
│   ├── about.html
│   └── blog.html
├── Dockerfile
├── Jenkinsfile
├── about.html
├── blog.html
├── class.html
├── docker-compose.yml
└── index.html

### 11. Dockerfile: Defines how to build the Apache HTTP Server container.
* Jenkinsfile: Defines the pipeline for building and deploying the Docker container.
* docker-compose.yml: Defines the multi-container setup, including the web server and monitoring services.
* newsite/: Contains the website’s HTML, CSS, and JavaScript files.

### 12. Usage

* Clone the Repository
Clone this repository to your local machine:
git clone https://github.com/mloges-h/logesh-pro1.git
cd logesh-pro1

* Build and Run Docker Containers
You can build and start the Docker containers using Docker Compose:
docker-compose up --build

* Access the Web Server
The Apache web server is accessible at http://<host-ip>:81.

* Monitoring
Prometheus metrics can be accessed at http://<host-ip>:9090 and Grafana at http://<host-ip>:3000.

* Contributing
Feel free to fork this repository, make changes, and submit pull requests. Contributions are welcome!

* License
This project is licensed under the MIT License.
