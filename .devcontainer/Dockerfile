# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.0/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.16, 3.15, 3.14, 3.13
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ENV MARP_VERSION=2.2.0

RUN wget https://github.com/marp-team/marp-cli/releases/download/v${MARP_VERSION}/marp-cli-v${MARP_VERSION}-linux.tar.gz -O marp.tar.gz &&\
   	tar xvf marp.tar.gz -C /usr/local/bin
# ** [Optional] Uncomment this section to install additional packages. **
# RUN apk update \
#     && apk add --no-cache <your-package-list-here>

# dagger
RUN cd /usr/local \
	&& curl -L https://dl.dagger.io/dagger/install.sh | sh