# Start from the Ubuntu 22.04 base image
FROM ubuntu:22.04

# Install the dependencies
RUN apt-get update && apt-get install -y curl iproute2 sshfs unzip less groff

# Download and install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm awscliv2.zip
