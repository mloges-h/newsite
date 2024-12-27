pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'  // GitHub repository URL
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'  // Path to docker-compose.yml in your repository
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the repository from GitHub
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
                // Install any dependencies (you can modify this if you need more steps here)
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build your application (modify if necessary)
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                // Run your tests (if applicable)
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using your Dockerfile
                    sh 'docker build -t newsite-image .'
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    // Deploy the application using docker-compose (this assumes your docker-compose.yml is set up properly)
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} up -d"
                }
            }
        }

        stage('Monitor') {
            steps {
                script {
                    // You can add any monitoring steps if needed
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
