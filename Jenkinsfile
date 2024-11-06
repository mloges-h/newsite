pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-apache-html' // Name of your Docker image
        DOCKER_REGISTRY = 'docker.io'  // Or your own registry
        GITHUB_REPO = 'https://github.com/mloges-h/newsite.git' // Replace with your actual GitHub repo URL
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git url: "${GITHUB_REPO}", branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container to make sure it's working
                    docker.run("${DOCKER_IMAGE}", "-p 8080:80")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // You can add additional testing steps here, e.g., checking if the container is running.
                    echo 'Running tests...'
                    // Add any testing commands as needed, for example using curl to test the container.
                    sh 'curl http://localhost:8080'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    docker.withRegistry('', 'docker-hub-credentials') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy your Docker container
                    echo 'Deploying Docker container...'
                    // Example of running the Docker container in the background
                    sh 'docker run -d -p 8080:80 ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after pipeline
        }
    }
}
