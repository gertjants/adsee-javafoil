FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install \
    locales \
    git  \
    ca-certificates \
    git \
    sudo \
    tzdata \
    openssh-client \
    libicu-dev \
    openjdk-8-jdk \
    ca-certificates-java \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Define commonly used JAVA_HOME variable
RUN export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

