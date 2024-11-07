pipeline {
    agent any

    stages {
        stage('Build and Deploy') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh 'docker-compose down'  
                    // Build and start the new container in detached mode
                    sh 'docker-compose up -d'  
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
