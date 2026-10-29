pipeline {
    agent any

    tools {
        jdk 'JDK21'
    }

    environment {
        STUDENT_NAME = 'Absalyamov Ruslan'
        IMAGE_NAME   = 'absalyamov-ruslan-student-api'
        IMAGE_TAG    = 'v1.0-absalyamov-ruslan'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Pipeline started by student: ${STUDENT_NAME}"
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew --no-daemon clean bootJar -x test'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew --no-daemon test'
            }
            post {
                always {
                    junit 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG}"
                echo "Image ${IMAGE_NAME}:${IMAGE_TAG} built successfully for ${STUDENT_NAME}"
            }
        }
    }

    post {
        success {
            echo "SUCCESS: ${STUDENT_NAME} - pipeline finished"
        }
        failure {
            echo "FAILURE: ${STUDENT_NAME} - pipeline stopped"
        }
    }
}