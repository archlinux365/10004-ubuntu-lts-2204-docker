#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "frs.sourceforge.net"
ssh-keyscan "frs.sourceforge.net" >> /home/runner/.ssh/known_hosts
ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "github.com"
ssh-keyscan "github.com" >> /home/runner/.ssh/known_hosts
cat /home/runner/.ssh/known_hosts

git config --global user.email "gnuhub@gmail.com"
git config --global user.name "gnuhub"

which podman
podman --version
env

cd $CMD_PATH


function docker_build()
{
	cd $CMD_PATH
	cd $1
	docker build . -f Dockerfile \
-t ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t ghcr.io/${GITHUB_REPOSITORY}-$1:latest \
-t gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER -t gnuhub/$PROJECT_NAME-$1:latest \
-t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest \
-t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest


docker push ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
docker push ghcr.io/${GITHUB_REPOSITORY}-$1:latest
# docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
# docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest
# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER 
# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest 
docker push gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER
docker push gnuhub/$PROJECT_NAME-$1:latest
}

docker_build 1001001-rootfs-min
# docker_build 1200-base-image
# docker_build 103-user-www
# docker_build 104-desktop-vnc
# docker_build 105-desktop-rdp
# docker_build 106-desktop-dde
# docker_build 107-actions-runner


cd ~/
git clone git@github.com:archlinux365/10004-ubuntu-lts-2204-docker.git


function get_versions_102_user_root()
{
	cd ~/
	cd 10004-ubuntu-lts-2204-docker
	cd 102-user-root
	rm -rf versions 
	rm -rf etc_apt
	cid=$(docker run -it --detach ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-102-user-root:latest)
	docker cp ${cid}:/root/versions/ ./versions/
	docker cp ${cid}:/etc/apt/ ./etc_apt/
}



function get_versions_107_actions_runner()
{
	cd ~/
	cd 10004-ubuntu-lts-2204-docker
	cd 107-actions-runner
	rm -rf versions 
	cid=$(docker run -it --detach ghcr.io/archlinux365/10004-ubuntu-lts-2204-docker-107-actions-runner:latest)
	docker cp ${cid}:/home/runner/versions/ ./versions/
}

# get_versions_102_user_root
# get_versions_107_actions_runner

cd ~/
cd 10004-ubuntu-lts-2204-docker
git add .
git commit -a -m "CI-BOT:$(date +%Y.%m.%d-%H%M%S)-$GITHUB_REF_NAME-$GITHUB_RUN_NUMBER"
git push origin HEAD

# timeout 200 docker-compose up
