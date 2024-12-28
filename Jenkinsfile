pipeline {
    agent any

    environment {
        IMAGE_NAME = 'custom-httpd'
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        BRANCH_NAME = 'master'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from GitHub
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
                    // Build the Docker image using the Dockerfile in the repository
                    sh 'docker build -t ${IMAGE_NAME}:latest .'
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // Deploy the Docker container
                    sh '''
                    docker stop custom-httpd-container || true
                    docker rm custom-httpd-container || true
                    docker run -d -p 81:80 --name custom-httpd-container ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment succeeded!'
        }
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
