pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew --no-daemon clean build -x test'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew --no-daemon test'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'build/test-results/test/*.xml'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t absalyamov-ruslan-student-api:latest .'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
        }
    }
}
