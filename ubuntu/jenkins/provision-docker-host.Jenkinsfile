pipeline {
    agent any
    parameters {
        string(name: "docker_host", trim: true, description: "Docker Hostname or IP")
        string(name: "docker_user",  trim: true, defaultValue: "root", description: "System user of Docker host")
        string(name: "bucket",  trim: true, defaultValue: "root", description: "S3 Bucket SSH Keys are stored in")
        string(name: "ssh_key_path",  trim: true, defaultValue: "root", description: "S3 object key for ssh key")
    }
    stages {
        stage('Download Dependencies') {
            steps {
                withAWS(region:"us-east-1", credentials:'aws-swfx') {
                    s3Download(file:'ssh-key', bucket:$params.bucket, path:$params.ssh_key_path, force:true)
                }
                sh "chmod 700 ssh-key"
            }
        }
        stage('Build') {
            steps {
                sh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i felix-ssh-key $params.docker_user@$params.docker_host < ubuntu/install-docker.sh"
            }
        }
    }
}
