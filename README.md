# Local AWS DevOps Lab

A containerized local development environment utilizing LocalStack and a custom Ubuntu client for AWS CLI operations.

## Architecture
- **local-aws-server**: Runs LocalStack to emulate AWS services locally.
- **ubuntu-aws-client**: A lightweight container pre-configured with Python 3 and AWS CLI v2.
- **devops-net**: Custom Docker bridge network for internal DNS resolution.

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
2. Access the Client Container
Attach an interactive terminal to the Ubuntu client to start executing commands:

Bash
docker exec -it ubuntu-aws-client bash
💻 Usage
Using the AWS CLI
Because the awslocal package is installed and the AWS_ENDPOINT_URL environment variable is set, you don't need to specify endpoint URLs manually.

Create a test S3 bucket:

Bash
awslocal s3 mb s3://devops-test-bucket
List the buckets:

Bash
awslocal s3 ls
Using Python (Boto3)
Modern versions of boto3 automatically detect the AWS_ENDPOINT_URL environment variable defined in our Docker Compose file. You can run standard Python scripts without hardcoding LocalStack endpoints:

Python
import boto3

# Automatically routes to http://local-aws:4566
s3 = boto3.client('s3')
response = s3.list_buckets()
print(response)
🧹 Cleanup
To tear down the environment and remove the containers and network:

Bash
docker compose down
Maintained by Bhushan Chougale