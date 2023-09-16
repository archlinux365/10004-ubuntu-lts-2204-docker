FROM ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-102-user-root:latest

# 1
ENV TERM=xterm-256color
COPY files/ /opt/9318/

# 2
RUN chown -R runner:runner /opt/9318/
USER runner
WORKDIR /home/runner
ENV USER=runner
ENV HOME=/home/runner
RUN /opt/9318/docker.install.runner.sh

# 3
RUN rm -rf /opt/9318/
