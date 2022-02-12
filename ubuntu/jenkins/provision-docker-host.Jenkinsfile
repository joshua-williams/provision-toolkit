pipeline {
    agent any
    parameters {
        string(name: "docker_host", trim: true, description: "Docker Hostname or IP")
        string(name: "docker_user",  trim: true, description: "System user of Docker host")
    }
    stages {
        stage('Dependencies') {
            steps {
                git branch: "main", url: "https://github.com/joshua-williams/provision-tool-kit.git"
                withAWS(region:"us-east-1", credentials:'aws-swfx') {
                    s3Download(file:'felix-ssh-key', bucket:'felix-devops', path:'ssh-keys/felix/felix', force:true)
                    s3Download(file:'bitbucket-ssh-key', bucket:'felix-devops', path:'ssh-keys/bitbucket/bitbucket', force:true)
                }
                sh "chmod 700 felix-ssh-key bitbucket-ssh-key"

            }
        }
        stage('Build') {
            steps {
                sh "cat ubuntu/provision-docker-host.sh > install_docker.sh"
                sh "cat ubuntu/add-docker-user.sh >> install_docker.sh"
                sh "chmod +x install_docker.sh"
                sh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i felix-ssh-key $params.docker_user@$params.docker_host < install_docker.sh"
            }
        }
    }
}
