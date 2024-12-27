pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
    }

    triggers {
        // Poll SCM every minute to check for updates
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Check out the code from the specified repository and branch
                git url: "${REPO_URL}", branch: 'master'
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    // Stop any running containers and deploy the latest version with rebuild
                    sh '''
                    docker-compose down
                    docker-compose up -d --build
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace to avoid leftover files
            cleanWs()
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
    }
}
