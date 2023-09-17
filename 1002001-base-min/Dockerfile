FROM ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-1001001-rootfs-min:latest

COPY . /bd_build
COPY files/ /opt/9318/


RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh

ENV DEBIAN_FRONTEND="teletype" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

# CMD ["/sbin/my_init"]


USER root
WORKDIR /root
ENV USER=root
ENV HOME=/root
RUN /opt/9318/docker.install.root.sh


CMD ["sh"]
