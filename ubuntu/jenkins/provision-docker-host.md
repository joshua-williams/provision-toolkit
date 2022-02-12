# Provision Docker Host

This Jenkins pipeline installs Docker on an Ubuntu instance along with a docker user.

### Jenkins Plugins
- [AWS Pipeline Plugin](https://github.com/jenkinsci/pipeline-aws-plugin)
### SSH Keys
SSH keys are stored in AWS S3 bucket.
This pipeline gets access to that bucket through the AWS credentials stored in Jenkins Credentials.

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
#### TODO
The bucket name and object keys are hard coded. Need to paramaterize those values


