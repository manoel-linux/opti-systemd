# OPTI-SYSTEMD

- opti-systemd-version: sep 2023

- build-latest: 0.0.1

- Support for the distro: Ubuntu/Debian/Arch/Manjaro

- If you are using a distribution based on Ubuntu, Debian, or Arch, the script will work without any issues.

- Use at your own risk

- opti-systemd is an open-source project, and we are happy to share it with the community. You have complete freedom to do whatever you want with opti-systemd, in accordance with the terms of the MIT license. You can modify, distribute, use it in your own projects, or even create a fork of opti-systemd to add additional features.

## Installation

- To install OPTI-SYSTEMD, follow the steps below:

# 1. Clone this repository by running the following command

- git clone https://github.com/manoel-linux/opti-systemd.git

# 2. To install the OPTI-SYSTEMD script, follow these steps

- chmod a+x `installupdate.sh`

- sudo `./installupdate.sh`

# For check version

sudo `opti-systemd-version`

# For stop the opti-systemd

sudo `opti-systemd-stop`

# For start the opti-systemd

sudo `opti-systemd-start`

# For uninstall

- chmod a+x `uninstall.sh`

- sudo `./uninstall.sh`

# If opti-systemd causes the system to fail to start, use the following command:

- It backs up the "systemd.conf" file with the name "systemd.conf.bak" in "/etc/systemd".
- If any issues arise, you can simply delete the "systemd.conf" file and use the following command to copy the backup "systemd.conf.bak" back to "/etc/systemd":

- To begin, start from a live CD of your distribution, which can be Ubuntu, Lubuntu, Arch Linux, or another of your choice.

- You will need to mount the partition where the '/' (slash) is located, and you should mount it at /mnt.

- sudo rm -rf /mnt/etc/systemd/systemd.conf

- sudo cp /mnt/etc/systemd/systemd.conf.bak /etc/systemd/systemd.conf

- When the system starts, you download 'opti-systemd,' and in the folder, to uninstall, use the following command:

- chmod a+x `uninstall.sh`

- sudo `./uninstall.sh`

- If any issues occur, you can address them using this uninstallation process.

# Other Projects

- DEB2XBPS: A tool I developed based on the code of xdeb, specifically designed for Void Linux. DEB2XBPS enables the conversion of .deb packages to the .xbps   format used in Void Linux, simplifying package management in this distribution. You can find the source code and additional information about DEB2XBPS in the  following repository: https://github.com/manoel-linux/deb2xbps-shlibs-voidpackages It is based on the xdeb.

- way-display-guard is a tool that can resolve a display:0 issue when attempting to run a program as a superuser or using "sudo." Remember to execute the way-display-guard every time you shut down or restart your PC. You can find the source code and more information about way-display-guard in the following repository: https://github.com/manoel-linux/way-display-guard

- The script-xanmod-installer-unofficial simplifies Xanmod kernel installation on Linux systems. It's not officially maintained by the Xanmod project, but provides a convenient option for users to experience Xanmod's features on their preferred distributions. Please note that it comes with no responsibility or warranty from the Xanmod project. You can find the source code and more information about install-uefi-in-qemu in the following repository: https://github.com/manoel-linux/script-xanmod-installer-unofficial

- opti-sway-i3wm is a tool to optimize the boot process of Sway/i3-wm and make the PC boot faster. You can find the source code and more information about opti-sway-i3wm in the following repository: https://github.com/manoel-linux/opti-sway-i3wm

- opti-gnome-wayland is a powerful program aimed at optimizing the GNOME boot process and reducing memory usage, resulting in a lighter and more efficient GNOME  desktop environment. With this tool, you can enjoy a faster and more responsive experience when using GNOME, even on systems with limited resources. You can find the source code and more information about opti-gnome-wayland in the following repository: https://github.com/manoel-linux/opti-gnome-wayland

- The install-uefi-in-qemu script is a tool for installing QEMU UEFI when the UEFI BIOS is not included or available in the distribution's repository. You can find the source code and more information about install-uefi-in-qemu in the following repository: https://github.com/manoel-linux/install-uefi-in-qemu

- CPU-T A command-line tool that I developed from scratch. CPU-T provides detailed information about the CPU of your system, including CPU model, number of cores and threads, CPU frequency, supported instructions, memory information, disk information, network information, and more. It is a useful tool for system analysis and optimization. You can find the source code and more information about CPU-T in the following repository: https://github.com/manoel-linux/cpu-t

- The ZRAM-SYSTEMD script streamlines Zram activation and configuration on Linux systems with systemd. It's particularly useful when distributions lack a modern tool for managing Zram effectively. This script provides a straightforward solution for users looking to utilize Zram's benefits. You can find the source code and more information about zram-systemd in the following repository: https://github.com/manoel-linux/zram-systemd

- The force-opengl-version is a script that allows forcing a version of OpenGL that the GPU does not support, keeping in mind that some programs/.jar files may work without any issues in certain cases, while others may encounter problems. You can find the source code and more information about force-opengl-version in the following repository: https://github.com/manoel-linux/force-opengl-version

# Project Status

- The OPTI-SYSTEMD project is currently in development. The latest stable version is 0.0.1. We aim to provide regular updates and add more features in the future.

# License

- OPTI-SYSTEMD is licensed under the MIT License. See the LICENSE file for more information.

# Acknowledgements

- We would like to thank the open-source community for their support and the libraries used in the development of OPTI-SYSTEMD.
