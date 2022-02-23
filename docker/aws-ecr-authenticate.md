## Authenticate Docker Client with AWS ECR

To push and pull docker images from Amazon ECR, the Docker client must be authenticated.
This script authenticates the docker client with Amazon Elastic Container Registry.  

- A token is generated and will be valid for 12 hours
- The token is piped into the docker login command along with the ECR registration endpoint

### AWS Credentials

The aws credentials should already be stored in ~/.aws/credentials

### Usage: 
`aws-ecr-authenticate ${account_id} ${region}`

See [Authenticate Default Registry](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html#cli-authenticate-registry) in AWS Docs