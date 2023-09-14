#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

apt update -y

export DEBIAN_FRONTEND=noninteractive

apt install debootstrap -y
debootstrap --no-check-gpg --variant=minbase --include=usrmerge --components=main,multiverse,restricted,universe jammy /jammy-rootfs http://us.archive.ubuntu.com/ubuntu/
