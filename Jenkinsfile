pipeline {
    agent { label 'devops-agent' }
    environment {
        IMAGE_NAME = "prtdemo:latest"
        CONTAINER_NAME = "prtdemo_container"
    }
    stages {
        stage('Checkout Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Pratyu0906/devops-prt-project'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    echo "Building Docker image..."
                    sudo docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                    echo "Stopping any existing container..."
                    sudo docker rm -f ${CONTAINER_NAME} || true

                    echo "Running Docker container..."
                    sudo docker run -d --name ${CONTAINER_NAME} -p 8080:80 ${IMAGE_NAME}
                """
            }
        }

        stage('Verify Container') {
            steps {
                sh """
                    echo "Listing running containers..."
                    sudo docker ps
                """
            }
        }
    }

    post {
        always {
            sh 'echo "Pipeline finished"'
        }
    }
}
