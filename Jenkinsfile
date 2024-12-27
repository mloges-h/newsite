pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        PATH = "${env.PATH}:/usr/local/bin"  // Ensure Docker and Docker Compose are in the PATH
    }

    triggers {
        githubPush()  // Use webhook to trigger on GitHub push
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: "${REPO_URL}", branch: 'master', credentialsId: 'pro1'
            }
        }

        stage('Verify Docker and Docker Compose') {
            steps {
                script {
                    echo 'Verifying Docker and Docker Compose installation...'
                    sh 'docker --version'
                    sh 'docker-compose --version'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo 'Running application tests...'
                    sh 'npm test'  // Adjust based on your testing framework
                }
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    echo 'Building and deploying application with Docker Compose...'
                    // Ensure the containers are stopped before rebuilding
                    sh 'docker-compose down || true'
                    
                    // Build and start the containers in detached mode
                    sh 'docker-compose up -d --build'
                    
                    // Show the status of the containers
                    sh 'docker-compose ps'
                    
                    // Output logs for troubleshooting
                    sh 'docker-compose logs'
                }
            }
        }

        stage('Notify Monitoring') {
            steps {
                script {
                    echo 'Sending deployment metrics to Prometheus...'
                    // You can add logic to send metrics to Prometheus here if needed
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()  // Clean the workspace after each build
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed. Check the logs for details.'
        }
    }
}
