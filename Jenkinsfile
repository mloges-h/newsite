pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-apache-html'
        DOCKER_REGISTRY = 'docker.io'
        GITHUB_REPO = 'https://github.com/mloges-h/newsite.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${GITHUB_REPO}", branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside("-p 8082:80") {
                        // Run any commands needed to test or validate the container
                        sh 'curl http://localhost:8082'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-credentials') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Running the container in detached mode
                    sh "docker run -d -p 8082:80 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
