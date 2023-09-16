#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env

cd ~
mkdir dev
rm -rf versions
mkdir versions
cd versions
apt list > apt.list.origin.txt
apt list --installed > apt.list.installed.origin.txt
