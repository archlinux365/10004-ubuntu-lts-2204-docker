FROM ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-102-user-root:latest

# 1
ENV TERM=xterm-256color
COPY files/ /opt/9318/
RUN sudo chown -R www:www /opt/9318/

# 2
USER runner
WORKDIR /home/runner
ENV USER=runner
ENV HOME=/home/runner
RUN /opt/9318/docker.install.runner.sh

# 3
RUN sudo rm -rf /opt/9318/
