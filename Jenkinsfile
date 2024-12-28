pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        BRANCH_NAME = 'master'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout code from the GitHub repository
                    checkout([$class: 'GitSCM', 
                              branches: [[name: "*/${BRANCH_NAME}"]], 
                              doGenerateSubmoduleConfigurations: false, 
                              extensions: [[$class: 'CleanCheckout']], 
                              submoduleCfg: [], 
                              userRemoteConfigs: [[url: REPO_URL, credentialsId: 'pro1']]])
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the existing Dockerfile
                    sh 'docker build -t custom-httpd:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the built image
                    sh '''
                    docker rm -f custom-httpd-container || true
                    docker run -d -p 81:80 --name custom-httpd-container custom-httpd:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
        always {
            echo 'Pipeline execution completed.'
            // Clean workspace to ensure no residual files are left
            cleanWs()
        }
    }
}
