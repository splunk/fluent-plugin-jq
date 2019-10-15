#!/usr/bin/env bash
set -e
aws ecr get-login --region $AWS_REGION --no-include-email | bash
echo "Building docker image..."
cp /tmp/pkg/fluent-plugin-jq-*.gem docker
docker build --no-cache -t splunk/fluent-plugin-jq:jq ./example
docker tag splunk/fluent-plugin-jq:jq $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/fluent-plugin-jq:latest
echo "Push docker image to ecr..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/fluent-plugin-jq:latest | awk 'END{print}'
echo "Docker image pushed successfully."