# Sample run:
#   docker run --rm -it -p 7777:7777/udp -p 7778:7778/udp -p 27015:27015/udp -p 27021:27021/tcp -v ArkData:/home/steam/ARK/ShooterGame/Saved/ ark bash
#   docker run --rm -d -p 7777:7777/udp -p 7778:7778/udp -p 27015:27015/udp -p 27021:27021/tcp ark

FROM ubuntu:16.04

# Install tools and dependencies
RUN apt-get update && apt-get install -y \
        tmux \
        perl-modules \
        curl \
        lsof \
        libc6-i386 \
        lib32gcc1 \
        bzip2 \
        && \
    rm -rf /var/lib/apt/lists/*

# Create user `steam`
RUN groupadd -g 999 steam && \
    useradd -r -u 999 -g steam steam && \
    mkdir /home/steam && \
    chown -R steam:steam /home/steam

# Correct max files open issue
RUN echo 'fs.file-max=100000' >> /etc/sysctl.conf && \
    echo '*               soft    nofile          1000000' >> /etc/security/limits.conf && \
    echo '*               hard    nofile          1000000' >> /etc/security/limits.conf && \
    echo 'session required pam_limits.so' >> /etc/pam.d/common-session

# Install steamCMD
RUN mkdir -p /steamcmd && cd $_ && \
    curl -qL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

#Install ark-server-tools
RUN curl -L http://git.io/vtf5N | bash -s steam

EXPOSE 7777/udp 7778/udp 27015/udp 27021/tcp

USER steam
WORKDIR /home/steam

# Inport server config, install server, and install mods
COPY main.cfg /etc/arkmanager/instances/
RUN arkmanager install
RUN arkmanager installmods

CMD ["arkmanager", "run", "@all"]
