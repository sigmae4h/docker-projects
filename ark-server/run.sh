#!/bin/bash

set -x

export ARK_DIR="${HOME}/ARK"

# Run the server
${ARK_DIR}/ShooterGame/Binaries/Linux/ShooterGameServer "${MAP}?listen?SessionName=${SERVER_NAME}?ServerPassword=${SERVER_PASSWORD}?AltSaveDirectoryName=../../../saves?ServerAdminPassword=${ADMIN_PASSWORD}?Port=${PORT}?QueryPort=${QUERY_PORT}?RCONEnabled=True?RCONPort=${RCON_PORT}?GameModIds=${MODS}" -NoTransferFromFiltering -clusterid=${CLUSTER_NAME} -ClusterDirOverride=${HOME}/clusterdata
