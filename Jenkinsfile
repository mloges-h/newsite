pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        PATH = "${env.PATH}:/usr/local/bin" // Ensure Docker Compose is in the PATH
    }

    triggers {
        pollSCM('* * * * *') // Poll for changes every minute
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: "${REPO_URL}", branch: 'master'
            }
        }

        stage('Verify Docker and Docker Compose') {
            steps {
                script {
                    sh 'docker --version'
                    sh 'docker-compose --version'
                }
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose down || true' // Ignore errors if no containers are running
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean workspace
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
