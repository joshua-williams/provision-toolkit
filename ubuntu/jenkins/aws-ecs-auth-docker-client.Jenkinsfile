pipeline {
    agent: any
    parameters {
        string(name: "remote_host", trim: true, description: "Docker Hostname or IP")
        string(name: "remote_user",  trim: true, defaultValue: "root", description: "System user of Docker host")
        password(name: 'remote_password', defaultValue: 'SECRET', description: 'ssh password')
    }
    stage('Build') {
        steps {
            step {
                withAWS(region:"us-east-1", credentials:'aws-swfx') {
                    sh 'echo "working on it"'
                }

            }
        }
    }
}