## [Docker Registry Authentication with AWS ECR ](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html#cli-authenticate-registry)

This script authenticates a Docker client with an AWS Elastic Container Registry (ECR).
It will perform the following actions:
- Generate a ECR authentication token that is valid for 12 hours
- Login to docker client using the generated token and ECS endpoint

### Parameters
- remote_host - host name or ip address of docker host to authenticate
- remote_user - ssh user to login with
- remote_pass - ssh password 