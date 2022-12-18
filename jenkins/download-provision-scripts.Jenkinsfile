pipeline {
    agent any
    environment {
        GIT_SSH_COMMAND = 'ssh -i ~/.felix git pull'
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

