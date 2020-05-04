# Docker-ark
Ark server cluster in a docker container

## Customize (Optional)
Modify the `ENV` values in the `Dockerfile`

## Setup
- Forward the server ports on your router if you intend for connections from outside your LAN
    - Default ports are 7777-7781 udp and 27001-27002 udp
- Build the container: `docker build -t ark-base .`

## Run
- Single server:
    - Edit `wendy_ark.sh`
        - Change `MAP=...` to the map you want
        - Change `E:\Steam\steamapps...` to the location of your single player config files
    - `./wendy_ark.sh`
- Cluster:
    - Modify docker-compose.yml with the desired maps
    - Run `ark_server_pass=<your_server_pass> ark_admin_pass=<your_admin_pass> docker-compose up`
