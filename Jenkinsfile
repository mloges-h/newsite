pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Explicitly check out the latest code from the GitHub repository
                git url: "${REPO_URL}", branch: 'master'
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    // Stop any existing container and start a new one with the latest code
                    sh 'docker-compose down'
                    sh 'docker-compose up -d --build' // Rebuild to ensure changes are applied
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean up the workspace after each build
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
