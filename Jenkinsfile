pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'  // Replace with your GitHub repository URL
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Clone the latest code from the GitHub repository
                git url: "${REPO_URL}", branch: 'master'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    // Bring down any existing container and then start a new one with the updated files
                    sh 'docker-compose down'  // Stop the existing container
                    sh 'docker-compose up -d'  // Start the new container in detached mode
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean workspace to keep things tidy
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
