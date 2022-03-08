#!/usr/bin/env bash

# Usage: aws-ecr-authenticate accountId region
aws_account_id=$1
aws_region=$2
if [ -z $aws_account_id ]; then
  echo "Please enter AWS account id"
  exit 0
fi

if [ -z $aws_region ]; then
  aws_region="us-east-2"
fi
aws_registry_url="${aws_account_id}.dkr.ecr.${aws_region}.amazonaws.com"
aws_token=$(aws ecr get-login-password --region $aws_region)
docker login --username AWS --password $aws_token $aws_registry_url