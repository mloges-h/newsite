pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        PATH = "${env.PATH}:/usr/local/bin"
    }

    triggers {
        githubPush() // Trigger pipeline on push to GitHub repository
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from the repository
                git url: "${REPO_URL}", branch: 'master', credentialsId: 'pro1'
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo 'Running application tests...'
                    // Run your tests (replace with the actual test command)
                    sh 'npm test'
                }
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    echo 'Building and deploying application with Docker Compose...'
                    // Stop and remove existing containers (if any)
                    sh 'docker-compose down || true'
                    // Build and start containers in detached mode
                    sh 'docker-compose up -d --build'
                    // Show logs of the Docker Compose containers
                    sh 'docker-compose logs'
                }
            }
        }

        stage('Notify Monitoring') {
            steps {
                script {
                    echo 'Sending deployment metrics to Prometheus...'
                    // You can add your monitoring notification logic here
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            // Clean up the workspace after each run
            cleanWs()
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed. Check the logs for details.'
        }
    }
}
