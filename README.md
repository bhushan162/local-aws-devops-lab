# Local AWS DevOps Lab

A robust, containerized local development environment utilizing [LocalStack](https://localstack.cloud/) and a custom Ubuntu client. This project allows for seamless, offline AWS infrastructure testing and scripting without incurring cloud costs.


## Architecture

The environment is defined via `docker-compose.yml` and spins up two primary services connected via a custom bridge network (`devops-net`):

1. **`local-aws-server` (LocalStack)**: Emulates core AWS services locally (listening on port `4566`).
2. **`ubuntu-aws-client` (Ubuntu 24.04)**: A lightweight client container pre-configured with:
   - Python 3 & Pip
   - AWS CLI v2
   - `awslocal` (a wrapper to automatically route AWS CLI commands to LocalStack)
   - Environment variables configured to natively route Boto3/SDK requests to LocalStack.
3. **`devops-net`**: Custom Docker bridge network for internal DNS resolution.


  
## 🚀 Getting Started

## Prerequisites 
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### 1. Build and Run
Clone this repository and spin up the environment in detached mode:


1. Clone the repository:
   ```bash
   git clone https://github.com/bhushan162/local-aws-devops-lab
    ```
2. Spin up the environment
   ```bash
   docker compose up -d --build
   ```
3. Access the Client Container
Attach an interactive terminal to the Ubuntu client to start executing commands:
    ```Bash
    docker exec -it ubuntu-aws-client bash
    ```

## Usage
### Using the AWS CLI
Because the awslocal package is installed and the AWS_ENDPOINT_URL environment variable is set, you don't need to specify endpoint URLs manually.

Create a test S3 bucket:

```Bash
awslocal s3 mb s3://devops-test-bucket
```
List the buckets:

```Bash
awslocal s3 ls
```

## 🧹 Cleanup

To tear down the environment and remove the containers and network:

```Bash
docker compose down
```
Maintained by [Bhushan Chougale](https://github.com/bhushan162)