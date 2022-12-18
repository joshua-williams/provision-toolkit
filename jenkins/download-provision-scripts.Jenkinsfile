pipeline {
    agent any
    environment {
        GIT_SSH_COMMAND = 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/felix'
    }
    stages {

        stage('Download Provision Scripts') {
            steps {
                sh '''
                    if [[ ! -d provision-toolkit ]];then
                        git clone git@github.com:joshua-williams/provision-toolkit.git
                    fi
                '''
            }
        }
    }
}

