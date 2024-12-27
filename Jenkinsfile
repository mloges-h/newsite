pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mloges-h/newsite.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build('newsite-image', '.')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('newsite-image').run()
                }
            }
        }
    }
}
