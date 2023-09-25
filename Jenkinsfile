#ci
pipeline {
    agent any  // Run the pipeline on any available agent (node/agent)

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from version control (e.g., Git)
                // Replace the repository URL with your own
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build your project (e.g., compile code)
                sh 'echo "Building the project"'
            }
        }

        stage('Test') {
            steps {
                // Run tests (e.g., unit tests)
                sh 'echo "Running tests"'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy your application (e.g., to a test server)
                sh 'echo "Deploying the application"'
            }
        }
    }
}
