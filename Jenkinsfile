pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        PATH = "${env.PATH}:/usr/local/bin"
    }

    triggers {
        githubPush() // Use webhook for better efficiency
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
                    sh 'npm test' // Update with your test command
                }
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    echo 'Building and deploying application with Docker Compose...'
                    sh 'docker-compose down || true'
                    sh 'docker-compose up -d --build'
                    sh 'docker-compose logs'
                }
            }
        }

        stage('Notify Monitoring') {
            steps {
                script {
                    echo 'Sending deployment metrics to Prometheus...'
                    // Add monitoring hook here
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
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
