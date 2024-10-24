pipeline {
    agent {
        docker { 
            image 'node:20.18.0-alpine3.20'
            args '-p 3000:3000'
        }
    }
    stages {
        stage('Preparation') {
            steps {
                sh 'node --version'
                sh 'npm --version'
                sh 'ls -l'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'chmod +x start.sh'
                sh './start.sh'
            }
        }
        stage('Clean') {
            steps {
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'chmod +x kill.sh'
                sh './kill.sh'
                echo 'Cleaning....'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}