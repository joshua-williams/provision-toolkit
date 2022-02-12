# Provision Docker Host

This Jenkins pipeline installs Docker on an Ubuntu instance along with a docker user.

### Jenkins Plugins
- [AWS Pipeline Plugin](https://github.com/jenkinsci/pipeline-aws-plugin)
### SSH Keys
To install docker on the host machine, Jenkins will need ssh access to that server.

The ssh key should be stored in AWS S3 bucket.
This pipeline needs access to that bucket to get access to the Docker host.


Add a item to `Jenkins Credentials Store` to store your AWS credentials.

### Pipeline Setup
1. Create a Pipeline job and name it `Provision Docker Host`.

2. Set the pipeline with the following configuration:
   - Pipeline Script from SCM
   - Repository URL: https://github.com/joshua-williams/provision-tool-kit.git
   - Branch Specifier: main
   - Script Path: ubuntu/jenkins/provision-docker-host.Jenkinsfile
3. Save the job

The first time the script runs the parameters will be missing and the job will fail.
Subsequent runs will have the `Build with Parameters` to fill out the Docker host and user.

### Build with Parameters
- Docker Host: The ubuntu hostname or IP address 
- Docker User: The system user that will execute Docker on the ubuntu server
- S3 Bucket: S3 bucket the ssh keys are stored in
- SSH Key Path: S3 object key to the ssh key

#### TODO
Parameterize the AWS Credentials