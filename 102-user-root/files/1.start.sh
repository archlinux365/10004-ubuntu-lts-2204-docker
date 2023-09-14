#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

sudo -u root /usr/bin/supervisord -c /etc/supervisord.conf
