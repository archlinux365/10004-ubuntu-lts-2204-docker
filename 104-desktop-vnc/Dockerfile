FROM ghcr.io/archlinux365/10003-deepin-docker-beige-root:latest

# 1
ENV TERM=xterm-256color
COPY files/ /opt/9318/

# 2
USER www
WORKDIR /home/www
ENV USER=www
ENV HOME=/home/www
RUN /opt/9318/docker.install.www.sh

# 3
RUN rm -rf /opt/9318/
