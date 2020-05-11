# Sample run command:
# docker run -it --rm --name=ark_island -p 7777:7777/udp -p 7778:7778/udp -p 27015:27015/udp -v ArkIsland:/home/steam/ARK/ShooterGame/Saved/TheIsland ark-base

FROM cm2network/steamcmd:root

# Install tools and dependencies
RUN apt-get update && apt-get install -y \
        tmux \
        htop \
        perl-modules \
        curl \
        lsof \
        libc6-i386 \
        lib32gcc1 \
        bzip2 \
        findutils \
        rsync \
        && \
    rm -rf /var/lib/apt/lists/*

# Correct max files open issue
RUN echo 'fs.file-max=100000' >> /etc/sysctl.conf && \
    echo '*               soft    nofile          1000000' >> /etc/security/limits.conf && \
    echo '*               hard    nofile          1000000' >> /etc/security/limits.conf && \
    echo 'session required pam_limits.so' >> /etc/pam.d/common-session

# Install ark-server-tools
RUN curl -L http://git.io/vtf5N | bash -s steam

USER steam

# Install Ark
RUN mkdir -p /home/steam/ARK
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/ARK +app_update 376030 +quit

# Inject server specifics with defaults
ENV MAP="TheIsland"
ENV SERVER_NAME="Awesome Server"
ENV SERVER_PASSWORD=""
ENV ADMIN_PASSWORD="changeMe"
ENV CLUSTER_NAME="awesome_cluster_7654"
ENV PORT="7777"
ENV QUERY_PORT="27015"
ENV RCON_PORT="32330"
ENV MODS="797686039,1762210129,761535755,1213453992,731604991,719928795,793605978"

# Install mods
RUN arkmanager installmod $MODS

RUN mkdir -p /home/steam/clusterdata
RUN mkdir -p /home/steam/saves
RUN mkdir -p /home/steam/ARK/ShooterGame/Saved/Config/LinuxServer
COPY Game.ini GameUserSettings.ini /home/steam/ARK/ShooterGame/Saved/Config/LinuxServer/
COPY run.sh /home/steam

# Run the server
CMD ["/home/steam/run.sh"]
