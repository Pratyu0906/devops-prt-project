pipeline {
    agent { label 'devops-agent' }

    environment {
        IMAGE_NAME = 'prtdemo:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/Pratyu0906/devops-prt-project', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}", ".")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").run("-d -p 8081:80")
                }
            }
        }

        stage('Verify') {
            steps {
                echo "Docker container running at http://<MASTER_IP>:8081"
            }
        }
    }
}
