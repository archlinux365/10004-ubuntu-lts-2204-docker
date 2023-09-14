FROM ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-101-rootfs:latest

# 1
ENV TERM=xterm-256color
COPY files/ /opt/9318/

# 2
USER root
WORKDIR /root
ENV USER=root
ENV HOME=/root
RUN /opt/9318/docker.install.root.sh

# 3
RUN rm -rf /opt/9318/

