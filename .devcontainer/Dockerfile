FROM ubuntu:latest

RUN userdel -r ubuntu || true && \
    apt update && apt upgrade -y && \
    apt install -y git jq curl time build-essential libffi-dev libgmp-dev libncurses-dev \
        libgsl-dev liblapack-dev libblas-dev pkg-config pipx curl nodejs npm
