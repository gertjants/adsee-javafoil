FROM ubuntu:oracular

# Installing Java dependencies
RUN apt-get update \
    && apt-get -y install \
    locales \
    git  \
    ca-certificates \
    tzdata \
    wget \
    openjdk-8-jdk \
    ca-certificates-java \
    sharutils \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Define commonly used JAVA_HOME variable
RUN export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

# Installing xpra dependencies
RUN wget -O "/usr/share/keyrings/xpra.asc" https://xpra.org/xpra.asc
RUN wget -O "/etc/apt/sources.list.d/xpra.sources" https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/oracular/xpra.sources
RUN apt-get update \
    && apt-get -y install xpra wmctrl\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy xpra config file
COPY ./config/xpra.conf /etc/xpra/xpra.conf
COPY ./docker/entrypoint.sh /
RUN chmod +x /entrypoint.sh

# allow users to read default certificate
RUN chmod 644 /etc/xpra/ssl/ssl-cert.pem

# add javafoil user
RUN useradd --create-home --shell /bin/bash javafoil --gid xpra --uid 1001
WORKDIR /home/javafoil

# create run directory for xpra socket and set correct permissions for xpra user
RUN mkdir -p /run/user/1001/javafoil && chown -R 1001 /run/user/1001

# Expose xpra HTML5 client port
EXPOSE 14500

# Getting and install JavaFoil
USER 1001
RUN wget -O "/tmp/javafoilinstaller.sh" https://www.mh-aerotools.de/airfoils/java/javafoilinstaller.sh
RUN chmod +x /tmp/javafoilinstaller.sh 
RUN echo y | /tmp/javafoilinstaller.sh
COPY --chown=javafoil ./scripts/*.sh /home/javafoil/
RUN chmod +x /home/javafoil/MH-AeroTools/JavaFoil/JavaFoil.sh /home/javafoil/*.sh

ENTRYPOINT ["/entrypoint.sh"]