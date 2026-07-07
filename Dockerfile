FROM ubuntu:24.04

# Prevent interactive prompts during apt installations
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install Python and dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip curl unzip && \
    apt-get clean

# Install AWS CLI v2 natively
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

# Install the awslocal wrapper
RUN pip3 install awscli-local --break-system-packages

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Keep the container running in the background
CMD ["tail", "-f", "/dev/null"]