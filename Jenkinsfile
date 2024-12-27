pipeline {
    agent any

    environment {
        // Define the image name and repository URL here for reusability
        IMAGE_NAME = 'httpd'
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
        
        stage('Install Dependencies') {
            steps {
                script {
                    // Install dependencies for the Node.js app
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Node.js app
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests (optional)
                    sh 'npm test'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile in your repository
                    sh 'docker build -t ${IMAGE_NAME}:latest .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker image by running the container
                    sh '''
                    docker run -d -p 81:80 ${IMAGE_NAME}:latest
                    '''
                }
            }
        }

        stage('Monitor') {
            steps {
                script {
                    // Additional monitoring can be added here
                    echo 'Monitoring stage'
                }
            }
        }
    }

    post {
        success {
            // This block will run after successful pipeline execution
            echo 'Build succeeded!'
        }
        failure {
            // This block will run if the pipeline fails
            echo 'Build failed!'
        }
        always {
            // Optional: Clean up, remove temporary resources, etc.
            echo 'Pipeline completed.'
        }
    }
}
