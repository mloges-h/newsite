pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'  // Replace with your repo URL
        DOCKER_IMAGE = 'newsite-image'  // Docker image name you want to use
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [[$class: 'CleanCheckout']],
                        submoduleCfg: [],
                        userRemoteConfigs: [[url: "${REPO_URL}", credentialsId: 'pro1']]
                    ])
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install project dependencies using npm
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image from Dockerfile in the repo
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container from the built image
                    sh '''
                    docker run -d -p 80:80 \
                        --name newsite-container \
                        ${DOCKER_IMAGE}
                    '''
                }
            }
        }

        stage('Monitor') {
            steps {
                script {
                    // You can add monitoring or health check steps here if needed
                    echo 'Monitoring setup completed.'
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
