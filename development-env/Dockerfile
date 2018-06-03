# Build the image:
#   Eg: docker build -t dev:v1 .
#
# Sample run command:
#   docker run -ti --rm \
#       -p 8080:8080 \
#       -p 8200:8200 \
#       -p 9876:9876 \
#       -p 9999:9999 \
#       -v DataVolume1:/home/developer \
#       -e DISPLAY=${DISPLAY} \
#       --name dev \
#       dev:v1 \
#       bash
#
# Run ./idea to launch IntelliJ

FROM ubuntu:latest

# Install core tools
RUN apt-get update && apt-get install -y \
        ctags \
        curl \
        git \
        jq \
        software-properties-common \
        tmux \
        vim \
        wget \
    && rm -rf /var/lib/apt/lists/*

# Install Java 8 JDK
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && apt-get install -y \
        oracle-java8-installer \
    && rm -rf /var/lib/apt/lists/*

# Install nodejs 8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && apt-get install -y \
        nodejs \
    && rm -rf /var/lib/apt/lists/* && \
    npm install -g @angular/cli

# Install IntelliJ IDEA Ultimate
RUN wget -q https://download.jetbrains.com/idea/ideaIU-2018.1.4-no-jdk.tar.gz -O intellij.tar.gz && \
    mkdir -p /opt/intellij && \
    tar -xf intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm -f intellij.tar.gz && \
    apt-get update && apt-get install -y \
        libxext-dev \
        libxrender-dev \
        libxslt1.1 \
        libxtst-dev \
        libgtk2.0-0 \
        libcanberra-gtk-module \
    && rm -rf /var/lib/apt/lists/*

# Create user `developer`. Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer/IdeaProjects && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    ln -s /opt/intellij/bin/idea.sh /home/developer/idea && \
    chown ${uid}:${gid} -R /home/developer

WORKDIR /home/developer
USER developer

ENV HOME /home/developer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
