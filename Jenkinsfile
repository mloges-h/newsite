pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/mloges-h/newsite.git'
            }
        }

        stage('Build Website Container') {
            steps {
                echo 'Building website container...'
                sh 'docker build -t website-image .'
            }
        }

        stage('Run Website Container') {
            steps {
                echo 'Deploying website container...'
                sh 'docker run -d --name website -p 8080:80 website-image'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
