#!/bin/bash

echo Directory is $PWD/build
mkdir build 
cd build 
echo Downloading OS archive
wget ftp://ftp.phytec.de/pub/Software/Linux/BSP-Yocto-i.MX6/BSP-Yocto-i.MX6-PD18.1.1/BSP-Yocto-i.MX6-PD18.1.1.tar.xz
echo Extracting archive
tar xf BSP-Yocto-i.MX6-PD18.1.1.tar.xz > /dev/null
read -p "Change configs then press [Enter] key to start building.."
echo Installing prerequisites
sudo apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm >/dev/null
echo Building image 
source ./sources/poky/oe-init-build-env >/dev/null
bitbake phytec-qt5demo-image > /dev/null
read -p "Enter empty sdcard location (sdX) eg.. sda ,sdb" drv
echo "Writing to sdcard"
sudo dd if=phytec-qt5demo-image-phyflex-imx6-2-20190425150715.rootfs.sdcard of=/dev/$drv bs=1MB




 
