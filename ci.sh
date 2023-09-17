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
	# 0
	cd $CMD_PATH
	cd $1
	# 1
	docker build . -f Dockerfile \
		-t ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER \
		-t ghcr.io/${GITHUB_REPOSITORY}-$1:latest \
		-t gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER \
		-t gnuhub/$PROJECT_NAME-$1:latest \
		-t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER \
		-t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest \
		-t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER  \
		-t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest

	# 2
	docker push ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
	docker push ghcr.io/${GITHUB_REPOSITORY}-$1:latest
	# docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
	# docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest
	# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER 
	# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest 
	docker push gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER
	docker push gnuhub/$PROJECT_NAME-$1:latest

	# 3
	if [ -d versions ];then
		rm -rf versions
	fi
	mkdir versions
	cd versions
	docker run ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER apt list > apt.list.txt
	docker run ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER apt list --installed > apt.list.installed.txt

}

docker_build 1001001-rootfs-min
docker_build 1200-base-image
# docker_build 103-user-www
# docker_build 104-desktop-vnc
# docker_build 105-desktop-rdp
# docker_build 106-desktop-dde
# docker_build 107-actions-runner



git remote set-url origin git@github.com:archlinux365/10004-ubuntu-lts-2204-docker.git
git add .
git commit -a -m "CI-BOT:$(date +%Y.%m.%d-%H%M%S)-$GITHUB_REF_NAME-$GITHUB_RUN_NUMBER"
git push origin HEAD

