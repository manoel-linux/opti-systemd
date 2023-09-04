#!/bin/bash

clear

show_main_menu() {
while true; do
clear
echo "#################################################################"
echo "(opti-systemd-installer) >> (sep 2023)"
echo "#################################################################"
echo " ███████  ██████ ██████  ██ ██████  ████████ "
echo " ██      ██      ██   ██ ██ ██   ██    ██    "
echo " ███████ ██      ██████  ██ ██████     ██    "
echo "      ██ ██      ██   ██ ██ ██         ██    "
echo " ███████  ██████ ██   ██ ██ ██         ██    "  
echo "#################################################################"
echo "(opti-systemd-github) >> (https://github.com/manoel-linux/opti-systemd)"
echo "#################################################################"

if [[ $EUID -ne 0 ]]; then
echo " ███████ ██████  ██████   ██████  ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██ ██ "
echo " █████   ██████  ██████  ██    ██ ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██    "
echo " ███████ ██   ██ ██   ██  ██████  ██   ██ ██ "                                                                                        
echo "#################################################################"
echo "(Superuser privileges or sudo required to execute the script)" 
echo "#################################################################"
exit 1
fi

sudo pacman -Sy
sudo pacman -S iputils -y
echo "#################################################################"
sudo apt-get update
sudo apt-get install --no-install-recommends inetutils-ping -y
echo "#################################################################"

clear

echo "#################################################################"
echo "(1)> (Install) >> (the OPTI-SYSTEMD version of Ubuntu/Debian)"
echo "(2)> (Install) >> (the OPTI-SYSTEMD version of Arch-Manjaro)"
echo "(3)> (Exit)"
echo "#################################################################"

read -p "(Enter your choice) >> " choice
echo "#################################################################"

case $choice in
1)
show_ubuntu-debian
;;
2)
show_arch-manjaro
;;
3)
exit 0
;;
*)
echo "(Invalid choice. Please try again)"
echo "#################################################################"
sleep 2
;;
esac
done
}

show_ubuntu-debian() {
while true; do
clear
if [ ! -x /bin/systemctl ]; then
echo "#################################################################"
echo "(Warning) >> (Your system doesn't have systemd)"
echo "#################################################################"
exit 1
fi
if [ ! -x /bin/apt ]; then
echo "#################################################################"
echo "(Warning) >> (You are trying to run a version meant for another distribution) 
(To prevent issues, the script has blocked a warning to execute the version meant for your distribution)"
echo "#################################################################"
exit 1
fi
echo "#################################################################"
read -p "(This action may have unintended consequences. Are you sure you want to continue) (y/n) >> " second_confirm
echo "#################################################################"
if [[ "$second_confirm" == "y" || "$second_confirm" == "Y" ]]; then
read -p "(Warning) >> (This script is provided 'AS IS', without any warranties of any kind. The user assumes full responsibility for executing this script and any resulting consequences. We recommend backing up your data before proceeding. If the script does not cause any apparent issues, you can use the PC normally. Are you sure you want to proceed) (y/n) >> " third_confirm
echo "#################################################################"
if [[ "$third_confirm" == "y" || "$third_confirm" == "Y" ]]; then
echo "(Proceeding with the changes)"
else
echo "(Action canceled by the user)"
echo "#################################################################"
exit 1
fi
else
echo "(Action canceled by the user)"
echo "#################################################################"
exit 1
fi
echo "#################################################################"
echo "(Checking for updates in Ubuntu/Debian)" 
echo "#################################################################"
sudo apt-get update
sudo apt-get install --no-install-recommends unzip binutils tar curl xz-utils grep gawk sed -y
clear
echo "#################################################################"

read -p "(Do you want to update your system) (y/n) >> " choice
echo "#################################################################"
if [[ $choice == "y" || $choice == "Y" ]]; then
sudo apt-get update
sudo apt-get upgrade -y
else
echo "(Skipping system update)"
echo "#################################################################"
fi

clear

sudo rm -rf /usr/bin/opti-systemd

sudo cp systemd/opti-systemd /usr/bin/

sudo cp -n /etc/systemd/system.conf /etc/systemd/system.conf.bak

clear

echo "#!/bin/bash

sed -i -E 's/^#?LogLevel=.*/LogLevel=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogTarget=.*/LogTarget=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogColor=.*/LogColor=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogLocation=.*/LogLocation=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogTime=.*/LogTime=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DumpCore=.*/DumpCore=no/' /etc/systemd/system.conf
sed -i -E 's/^#?ShowStatus=.*/ShowStatus=yes/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashChangeVT=.*/CrashChangeVT=no/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashShell=.*/CrashShell=no/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashReboot=.*/CrashReboot=no/' /etc/systemd/system.conf
sed -i -E 's/^#?NUMAPolicy=.*/NUMAPolicy=no/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogSec=.*/RuntimeWatchdogSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogPreSec=.*/RuntimeWatchdogPreSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogPreGovernor=.*/RuntimeWatchdogPreGovernor=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RebootWatchdogSec=.*/RebootWatchdogSec=5min/' /etc/systemd/system.conf
sed -i -E 's/^#?KExecWatchdogSec=.*/KExecWatchdogSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?StatusUnitFormat=.*/StatusUnitFormat=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimerAccuracySec=.*/DefaultTimerAccuracySec=5min/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStandardOutput=.*/DefaultStandardOutput=null/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStandardError=.*/DefaultStandardError=null/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutStartSec=.*/DefaultTimeoutStartSec=30s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=30s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutAbortSec=.*/DefaultTimeoutAbortSec=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultDeviceTimeoutSec=.*/DefaultDeviceTimeoutSec=60s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultRestartSec=.*/DefaultRestartSec=1000ms/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStartLimitIntervalSec=.*/DefaultStartLimitIntervalSec=10s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStartLimitBurst=.*/DefaultStartLimitBurst=3/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultCPUAccounting=.*/DefaultCPUAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultIOAccounting=.*/DefaultIOAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultIPAccounting=.*/DefaultIPAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryAccounting=.*/DefaultMemoryAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTasksAccounting=.*/DefaultTasksAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTasksMax=.*/DefaultTasksMax=20%/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryPressureThresholdSec=.*/DefaultMemoryPressureThresholdSec=100ms/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryPressureWatch=.*/DefaultMemoryPressureWatch=yes/' /etc/systemd/system.conf" > systemd/opti-systemd

sudo sed -i -E 's/^#?LogLevel=.*/LogLevel=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogTarget=.*/LogTarget=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogColor=.*/LogColor=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogLocation=.*/LogLocation=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogTime=.*/LogTime=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DumpCore=.*/DumpCore=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?ShowStatus=.*/ShowStatus=yes/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashChangeVT=.*/CrashChangeVT=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashShell=.*/CrashShell=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashReboot=.*/CrashReboot=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?NUMAPolicy=.*/NUMAPolicy=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogSec=.*/RuntimeWatchdogSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogPreSec=.*/RuntimeWatchdogPreSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogPreGovernor=.*/RuntimeWatchdogPreGovernor=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RebootWatchdogSec=.*/RebootWatchdogSec=5min/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?KExecWatchdogSec=.*/KExecWatchdogSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?StatusUnitFormat=.*/StatusUnitFormat=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimerAccuracySec=.*/DefaultTimerAccuracySec=5min/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStandardOutput=.*/DefaultStandardOutput=null/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStandardError=.*/DefaultStandardError=null/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutStartSec=.*/DefaultTimeoutStartSec=30s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=30s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutAbortSec=.*/DefaultTimeoutAbortSec=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultDeviceTimeoutSec=.*/DefaultDeviceTimeoutSec=60s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultRestartSec=.*/DefaultRestartSec=1000ms/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStartLimitIntervalSec=.*/DefaultStartLimitIntervalSec=10s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStartLimitBurst=.*/DefaultStartLimitBurst=3/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultCPUAccounting=.*/DefaultCPUAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultIOAccounting=.*/DefaultIOAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultIPAccounting=.*/DefaultIPAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryAccounting=.*/DefaultMemoryAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTasksAccounting=.*/DefaultTasksAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTasksMax=.*/DefaultTasksMax=20%/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryPressureThresholdSec=.*/DefaultMemoryPressureThresholdSec=100ms/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryPressureWatch=.*/DefaultMemoryPressureWatch=yes/' /etc/systemd/system.conf

sudo systemctl daemon-reload

sudo systemctl stop optisystemd.service

sudo systemctl disable optisystemd.service

sudo rm -rf /usr/bin/opti-systemd-version

sudo rm -rf /usr/bin/opti-systemd-start

sudo rm -rf /usr/bin/opti-systemd-stop

sudo rm -rf /etc/systemd/system/opti-systemd

sudo rm -rf /etc/systemd/system/optisystemd.service

sudo cp systemd/opti-systemd /etc/systemd/system/

sudo cp systemd/optisystemd.service /etc/systemd/system/

sudo cp systemd/opti-systemd-version /usr/bin/

sudo cp systemd/opti-systemd-start /usr/bin/

sudo cp systemd/opti-systemd-stop /usr/bin/

sudo chmod +x /etc/systemd/system/opti-systemd

sudo chmod +x /usr/bin/opti-systemd-version

sudo chmod +x /usr/bin/opti-systemd-start

sudo chmod +x /usr/bin/opti-systemd-stop

sudo systemctl daemon-reload

sudo systemctl enable optisystemd.service

sudo systemctl start optisystemd.service

sudo systemctl daemon-reload

sudo systemctl enable optisystemd.service

sudo systemctl start optisystemd.service

clear

echo "#################################################################"
echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ "  
echo "#################################################################"
echo "(Installation/Update completed)"
echo "#################################################################"
echo "(To stop the opti-systemd, use the command >> sudo opti-systemd-stop)"
echo "(To start the opti-systemd, use the command >> sudo opti-systemd-start)"
echo "(To check the version of opti-systemd, use the command >> sudo opti-systemd-version)"
echo "#################################################################"  
read -p "(To apply the changes, you need to restart system) (y/n) >> " confirm
                
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
echo "#################################################################"
echo "(Restarting the system)"    
echo "#################################################################"
sudo reboot
else
echo "#################################################################"
echo "(Restart canceled)"
echo "#################################################################"
fi
read -rsn1 -p "(press Enter to return to the main menu)
#################################################################" key
if [[ $key == "r" || $key == "R" ]]; then
continue
fi

break
done

echo "#################################################################"
}

show_arch-manjaro() {
while true; do
clear
if [ ! -x /bin/systemctl ]; then
echo "#################################################################"
echo "(Warning) >> (Your system doesn't have systemd)"
echo "#################################################################"
exit 1
fi
if [ ! -x /bin/pacman ]; then
echo "#################################################################"
echo "(Warning) >> (You are trying to run a version meant for another distribution) 
(To prevent issues, the script has blocked a warning to execute the version meant for your distribution)"
echo "#################################################################"
exit 1
fi
echo "#################################################################"
read -p "(This action may have unintended consequences. Are you sure you want to continue) (y/n) >> " second_confirm
echo "#################################################################"
if [[ "$second_confirm" == "y" || "$second_confirm" == "Y" ]]; then
read -p "(Warning) >> (This script is provided 'AS IS', without any warranties of any kind. The user assumes full responsibility for executing this script and any resulting consequences. We recommend backing up your data before proceeding. If the script does not cause any apparent issues, you can use the PC normally. Are you sure you want to proceed) (y/n) >> " third_confirm
echo "#################################################################"
if [[ "$third_confirm" == "y" || "$third_confirm" == "Y" ]]; then
echo "(Proceeding with the changes)"
else
echo "(Action canceled by the user)"
echo "#################################################################"
exit 1
fi
else
echo "(Action canceled by the user)"
echo "#################################################################"
exit 1
fi
echo "#################################################################"
echo "(Checking for updates in Arch/Manjaro)" 
echo "#################################################################"
sudo pacman -Sy
sudo pacman -S unzip binutils tar curl xz grep gawk sed -y
clear
echo "#################################################################"

read -p "(Do you want to update your system) (y/n) >> " choice
echo "#################################################################"
if [[ $choice == "y" || $choice == "Y" ]]; then
sudo pacman -Sy
sudo pacman -Syu -y
else
echo "(Skipping system update)"
echo "#################################################################"
fi

clear

sudo rm -rf /usr/bin/opti-systemd

sudo cp systemd/opti-systemd /usr/bin/

sudo cp -n /etc/systemd/system.conf /etc/systemd/system.conf.bak

clear

echo "#!/bin/bash

sed -i -E 's/^#?LogLevel=.*/LogLevel=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogTarget=.*/LogTarget=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogColor=.*/LogColor=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogLocation=.*/LogLocation=no/' /etc/systemd/system.conf
sed -i -E 's/^#?LogTime=.*/LogTime=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DumpCore=.*/DumpCore=no/' /etc/systemd/system.conf
sed -i -E 's/^#?ShowStatus=.*/ShowStatus=yes/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashChangeVT=.*/CrashChangeVT=no/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashShell=.*/CrashShell=no/' /etc/systemd/system.conf
sed -i -E 's/^#?CrashReboot=.*/CrashReboot=no/' /etc/systemd/system.conf
sed -i -E 's/^#?NUMAPolicy=.*/NUMAPolicy=no/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogSec=.*/RuntimeWatchdogSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogPreSec=.*/RuntimeWatchdogPreSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RuntimeWatchdogPreGovernor=.*/RuntimeWatchdogPreGovernor=off/' /etc/systemd/system.conf
sed -i -E 's/^#?RebootWatchdogSec=.*/RebootWatchdogSec=5min/' /etc/systemd/system.conf
sed -i -E 's/^#?KExecWatchdogSec=.*/KExecWatchdogSec=off/' /etc/systemd/system.conf
sed -i -E 's/^#?StatusUnitFormat=.*/StatusUnitFormat=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimerAccuracySec=.*/DefaultTimerAccuracySec=5min/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStandardOutput=.*/DefaultStandardOutput=null/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStandardError=.*/DefaultStandardError=null/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutStartSec=.*/DefaultTimeoutStartSec=30s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=30s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTimeoutAbortSec=.*/DefaultTimeoutAbortSec=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultDeviceTimeoutSec=.*/DefaultDeviceTimeoutSec=60s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultRestartSec=.*/DefaultRestartSec=1000ms/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStartLimitIntervalSec=.*/DefaultStartLimitIntervalSec=10s/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultStartLimitBurst=.*/DefaultStartLimitBurst=3/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultCPUAccounting=.*/DefaultCPUAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultIOAccounting=.*/DefaultIOAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultIPAccounting=.*/DefaultIPAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryAccounting=.*/DefaultMemoryAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTasksAccounting=.*/DefaultTasksAccounting=no/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultTasksMax=.*/DefaultTasksMax=20%/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryPressureThresholdSec=.*/DefaultMemoryPressureThresholdSec=100ms/' /etc/systemd/system.conf
sed -i -E 's/^#?DefaultMemoryPressureWatch=.*/DefaultMemoryPressureWatch=yes/' /etc/systemd/system.conf" > systemd/opti-systemd

sudo sed -i -E 's/^#?LogLevel=.*/LogLevel=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogTarget=.*/LogTarget=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogColor=.*/LogColor=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogLocation=.*/LogLocation=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?LogTime=.*/LogTime=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DumpCore=.*/DumpCore=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?ShowStatus=.*/ShowStatus=yes/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashChangeVT=.*/CrashChangeVT=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashShell=.*/CrashShell=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?CrashReboot=.*/CrashReboot=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?NUMAPolicy=.*/NUMAPolicy=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogSec=.*/RuntimeWatchdogSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogPreSec=.*/RuntimeWatchdogPreSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RuntimeWatchdogPreGovernor=.*/RuntimeWatchdogPreGovernor=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?RebootWatchdogSec=.*/RebootWatchdogSec=5min/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?KExecWatchdogSec=.*/KExecWatchdogSec=off/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?StatusUnitFormat=.*/StatusUnitFormat=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimerAccuracySec=.*/DefaultTimerAccuracySec=5min/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStandardOutput=.*/DefaultStandardOutput=null/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStandardError=.*/DefaultStandardError=null/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutStartSec=.*/DefaultTimeoutStartSec=30s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=30s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTimeoutAbortSec=.*/DefaultTimeoutAbortSec=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultDeviceTimeoutSec=.*/DefaultDeviceTimeoutSec=60s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultRestartSec=.*/DefaultRestartSec=1000ms/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStartLimitIntervalSec=.*/DefaultStartLimitIntervalSec=10s/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultStartLimitBurst=.*/DefaultStartLimitBurst=3/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultCPUAccounting=.*/DefaultCPUAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultIOAccounting=.*/DefaultIOAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultIPAccounting=.*/DefaultIPAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryAccounting=.*/DefaultMemoryAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTasksAccounting=.*/DefaultTasksAccounting=no/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultTasksMax=.*/DefaultTasksMax=20%/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryPressureThresholdSec=.*/DefaultMemoryPressureThresholdSec=100ms/' /etc/systemd/system.conf
sudo sed -i -E 's/^#?DefaultMemoryPressureWatch=.*/DefaultMemoryPressureWatch=yes/' /etc/systemd/system.conf

sudo systemctl daemon-reload

sudo systemctl stop optisystemd.service

sudo systemctl disable optisystemd.service

sudo rm -rf /usr/bin/opti-systemd-version

sudo rm -rf /usr/bin/opti-systemd-start

sudo rm -rf /usr/bin/opti-systemd-stop

sudo rm -rf /etc/systemd/system/opti-systemd

sudo rm -rf /etc/systemd/system/optisystemd.service

sudo cp systemd/opti-systemd /etc/systemd/system/

sudo cp systemd/optisystemd.service /etc/systemd/system/

sudo cp systemd/opti-systemd-version /usr/bin/

sudo cp systemd/opti-systemd-start /usr/bin/

sudo cp systemd/opti-systemd-stop /usr/bin/

sudo chmod +x /etc/systemd/system/opti-systemd

sudo chmod +x /usr/bin/opti-systemd-version

sudo chmod +x /usr/bin/opti-systemd-start

sudo chmod +x /usr/bin/opti-systemd-stop

sudo systemctl daemon-reload

sudo systemctl enable optisystemd.service

sudo systemctl start optisystemd.service

sudo systemctl daemon-reload

sudo systemctl enable optisystemd.service

sudo systemctl start optisystemd.service

clear

echo "#################################################################"
echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ "  
echo "#################################################################"
echo "(Installation/Update completed)"
echo "#################################################################"
echo "(To stop the opti-systemd, use the command >> sudo opti-systemd-stop)"
echo "(To start the opti-systemd, use the command >> sudo opti-systemd-start)"
echo "(To check the version of opti-systemd, use the command >> sudo opti-systemd-version)"
echo "#################################################################"  
read -p "(To apply the changes, you need to restart system) (y/n) >> " confirm
                
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
echo "#################################################################"
echo "(Restarting the system)"    
echo "#################################################################"
sudo reboot
else
echo "#################################################################"
echo "(Restart canceled)"
echo "#################################################################"
fi
read -rsn1 -p "(press Enter to return to the main menu)
#################################################################" key
if [[ $key == "r" || $key == "R" ]]; then
continue
fi

break
done

echo "#################################################################"
}

show_main_menu
