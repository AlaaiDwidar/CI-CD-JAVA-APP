pipeline {
    agent any

    parameters {
        string(name: 'DOCKER_IMAGE', description: 'Docker image name', defaultValue: 'java-app')
        string(name: 'NEXUS_REGISTRY', description: 'Nexus repository URL', defaultValue: 'http://192.168.185.158:8081/')
        credentials(name: 'NEXUS_CREDENTIALS', description: 'Nexus credentials', defaultValue: 'Nexus', required: true, credentialType: 'UsernamePassword')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        def dockerImage = docker.build("${params.DOCKER_IMAGE}:${env.BUILD_NUMBER}", '-f ./Dockerfile .')
                        dockerImage.inside {
                            sh 'cp ./SampleWebApp.war /usr/local/tomcat/webapps/SampleWebApp.war'
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error("Failed to build Docker image: ${e.message}")
                    }
                }
            }
        }
        stage('Push to Nexus') {
            steps {
                script {
                    try {
                        def dockerImage = docker.image("${params.DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                        docker.withRegistry("${params.NEXUS_REGISTRY}", "${params.NEXUS_CREDENTIALS}") {
                            dockerImage.push()
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error("Failed to push Docker image to Nexus: ${e.message}")
                    }
                }
            }
        }
    }
}
