FROM mcr.microsoft.com/devcontainers/javascript-node:20

RUN apt-get update && apt-get install -y \
    fzf \
    zsh \
    && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /home/node
