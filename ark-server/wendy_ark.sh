#!/bin/bash

docker run \
    -it \
    --rm \
    --name=ark \
    -p 7777:7777/udp \
    -p 7778:7778/udp \
    -p 27015:27015/udp \
    -e "MAP=Ragnarok" \
    -v ArkClusterData:/home/steam/clusterdata \
    -v ArkSaves:/home/steam/saves \
    -v "E:\Steam\steamapps\common\ARK\ShooterGame\Saved\Config\WindowsNoEditor":/home/steam/ARK/ShooterGame/Saved/Config/LinuxServer \
    ark-base
