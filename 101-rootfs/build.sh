#!/bin/bash

set -e

apt update

export DEBIAN_FRONTEND=noninteractive

apt install multistrap -y

multistrap -f jammy.multistrap || true

cp ubuntu-archive-keyring.gpg /jammy-rootfs/etc/apt/trusted.gpg.d

multistrap -f jammy.multistrap

cp sources.list /jammy-rootfs/etc/apt/sources.list

