pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-app' // Change to your desired image name
        NEXUS_REGISTRY = 'http://192.168.185.158:8081/'    // Change to your Nexus repository URL
        NEXUS_CREDENTIALS = 'Nexus' // Change to your Nexus credentials ID
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}", '-f ./Dockerfile .')
                    dockerImage.inside {
                        sh 'cp ./SampleWebApp.war /usr/local/tomcat/webapps/SampleWebApp.war'
                    }
                }
            }
        }
        stage('Push to Nexus') {
            steps {
                script {
                    def dockerImage = docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                    docker.withRegistry("${NEXUS_REGISTRY}", "${NEXUS_CREDENTIALS}") {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
