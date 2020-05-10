# Docker-ark
Ark server cluster in a docker container

## Customize (Optional)
Provide your own values in:
- Dockerfile ENV entries
- Game.ini and GameUserSettings.ini

## Run
- Single server LAN:
    - Build the container: `docker build -t ark-base .`
    - Change `MAP=...` to the map you want in `wendy_ark.sh`
    - `./wendy_ark.sh`
- Cluster:
    - Forward the server ports on your router
        - Default ports are 7777-7781 udp and 27001-27002 udp
    - Modify docker-compose.yml with the desired maps and settings
    - Run `ark_server_pass=<your_server_pass> ark_admin_pass=<your_admin_pass> docker-compose up`
