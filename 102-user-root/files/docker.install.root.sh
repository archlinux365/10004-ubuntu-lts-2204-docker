#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env
apt update -y
# 1 安装需要的包
apt install -y build-essential
apt install -y curl
apt install -y cron
apt install -y procps
apt install -y unzip
apt install -y ca-certificates
apt install -y curl
apt install -y gnupg
apt install -y lsb-release
apt install -y openssh-server
apt install -y git
apt install -y osc
apt install -y supervisor
apt install -y rsync
apt install -y sudo

apt install -y kpartx
apt install -y kpartx-root
apt install -y extlinux


rsync -avzP ./supervisord/ /etc/
chmod +x 1.start.sh
cp -fv ./1.start.sh /1.start.sh

cat /etc/passwd
groupadd runner
groupadd www
useradd -m -d /home/runner -G sudo -g runner runner -s /bin/bash
useradd -m -d /home/www -G sudo -g www www -s /bin/bash

echo "root:opendde" | chpasswd
echo "runner:opendde" | chpasswd
echo "www:opendde" | chpasswd

sed -i 's|ALL=(ALL:ALL) ALL|ALL=(ALL:ALL) NOPASSWD: ALL|g' /etc/sudoers
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

mkdir -p /etc/sudoers.d
echo "www ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root-nopassword
echo "runner ALL=(ALL) NOPASSWD: ALL"   > /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/www-nopassword
chmod 750 /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/
cat /etc/passwd

cd /root/
rm -rf versions
mkdir versions
cd versions

curl --insecure -fsSL https://code.midoks.me/midoks/mdserver-web/raw/branch/dev/scripts/install_dev.sh | bash > mdserver-web.txt
apt list > apt.list.origin.txt
apt list --installed > apt.list.installed.origin.txt
