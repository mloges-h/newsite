pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/mloges-h/newsite.git'
        PATH = "${env.PATH}:/usr/local/bin"
        LAUNCH_DIAGNOSTICS = '-Dorg.jenkinsci.plugins.durabletask.BourneShellScript.LAUNCH_DIAGNOSTICS=true' // Enable diagnostics
    }

    triggers {
        githubPush() // Use webhook for better efficiency
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: "${REPO_URL}", branch: 'master', credentialsId: 'pro1'
            }
        }

        stage('Verify Docker and Docker Compose') {
            steps {
                script {
                    echo 'Verifying Docker and Docker Compose installation...'
                    sh '/bin/bash -c "docker --version"'
                    sh '/bin/bash -c "docker-compose --version"'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo 'Running application tests...'
                    sh '/bin/bash -c "npm test"' // Replace with your test command
                }
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    echo 'Building and deploying application with Docker Compose...'
                    sh '/bin/bash -c "docker-compose down || true"' // Stop and remove containers
                    sh '/bin/bash -c "docker-compose up -d --build"' // Build and start containers
                    sh '/bin/bash -c "docker-compose logs"' // Show logs
                }
            }
        }

        stage('Notify Monitoring') {
            steps {
                script {
                    echo 'Sending deployment metrics to Prometheus...'
                    // Add Prometheus or monitoring notifications here
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed. Check the logs for details.'
        }
    }
}
