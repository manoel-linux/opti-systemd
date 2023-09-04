#!/bin/bash

clear
echo "#############################################################"
echo "(opti-systemd-uninstaller) >> (sep 2023)"
echo "#############################################################"
echo " ███████  ██████ ██████  ██ ██████  ████████ "
echo " ██      ██      ██   ██ ██ ██   ██    ██    "
echo " ███████ ██      ██████  ██ ██████     ██    "
echo "      ██ ██      ██   ██ ██ ██         ██    "
echo " ███████  ██████ ██   ██ ██ ██         ██    " 
echo "#############################################################"
echo "(opti-systemd-github) >> (https://github.com/manoel-linux/opti-systemd)"
echo "#############################################################"

if [[ $EUID -ne 0 ]]; then
echo " ███████ ██████  ██████   ██████  ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██ ██ "
echo " █████   ██████  ██████  ██    ██ ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██    "
echo " ███████ ██   ██ ██   ██  ██████  ██   ██ ██ "                                                                                        
echo "#############################################################"
echo "(Superuser privileges or sudo required to execute the script)" 
echo "#############################################################"
exit 1
fi

clear

sudo systemctl daemon-reload

sudo systemctl stop optisystemd.service

sudo systemctl disable optisystemd.service

sudo systemctl daemon-reload

sudo systemctl stop optisystemd.service

sudo systemctl disable optisystemd.service

sudo rm /usr/bin/opti-systemd

sudo rm /usr/bin/opti-systemd-version

sudo rm /usr/bin/opti-systemd-start

sudo rm /usr/bin/opti-systemd-stop

sudo rm -rf /etc/systemd/system/opti-systemd

sudo rm -rf /etc/systemd/system/optisystemd.service

sudo rm -rf /etc/systemd/system.conf.bak.1

sudo rm -rf /etc/systemd/system.conf

sudo cp /etc/systemd/system.conf.bak /etc/systemd/system.conf 

sudo rm -rf /etc/systemd/system.conf.bak

clear

echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ " 
echo "#############################################################"
echo "(Uninstallation completed)"
echo "#############################################################"
