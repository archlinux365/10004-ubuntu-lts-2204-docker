# 10004-ubuntu-lts-2204-docker

[![docker build](https://github.com/archlinux365/10004-ubuntu-lts-2204-docker/actions/workflows/ci.yml/badge.svg)](https://github.com/archlinux365/10004-ubuntu-lts-2204-docker/actions/workflows/ci.yml)


[![Docker Pulls](https://img.shields.io/docker/pulls/gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs.svg)](https://hub.docker.com/r/gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs/)


[![Docker Pulls](https://img.shields.io/docker/pulls/gnuhub/10004-ubuntu-lts-2204-docker-102-user-root.svg)](https://hub.docker.com/r/gnuhub/10004-ubuntu-lts-2204-docker-102-user-root/)


## 参与项目最重要的事情： 读代码 读代码 读代码

1. github ci:actions->.github/workflows/ci.yml 只是登陆docker仓库调用ci.sh
1. 从ci.sh开始阅读-->只是依次构建 101-107对应文件夹的Dockerfile 他们之间镜像有继承关系
1. 自定义文件放在 101-107 files
1. 调用和添加shell看对应files下docker.install.${USER}.sh 注意自己用户 sudo在基础镜像已经去掉密码 可以放心执行sudo
1. 执行情况看ci: https://github.com/archlinux365/10004-ubuntu-lts-2204-docker/actions
1. 这是一个很简单的项目： 只有几百行shell规模，read the fucking code 
1. talk is cheap,show me the code, just submit a pull request

## 0 目标

1. docker镜像: rootfs ci 开发 root以及www用户
1. 默认国内清华镜像源
1. ci镜像配置用户和基础工具链
1. ssh服务
1. vnc桌面
1. vscode server
1. linux管理面板
1. web进程管理
1. 添加ubuntudde源测试dde
1. 集成github actions镜像环境脚本 方便和github actions虚拟机环境一致


## 1 文件夹说明

1. 101-rootfs 构建基础rootfs [![Docker Pulls](https://img.shields.io/docker/pulls/gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs.svg)](https://hub.docker.com/r/gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs/)
1. 102-user-root 继承 101-rootfs镜像 安装配置 [![Docker Pulls](https://img.shields.io/docker/pulls/gnuhub/10004-ubuntu-lts-2204-docker-102-user-root.svg)](https://hub.docker.com/r/gnuhub/10004-ubuntu-lts-2204-docker-102-user-root/)
1. 103-user-www 继承 102-user-root 镜像 安装配置
1. 104-desktop-vnc 继承 103-user-www 镜像 安装配置
1. 105-desktop-rdp 继承 103-user-www 镜像 安装配置
1. 106-desktop-dde 继承 103-user-www 镜像 安装配置
1. 107-actions-runner 继承 103-user-root 镜像 使用runner用户 安装配置


## 2 开发指南

1. 放文件独立脚本 files
1. 调用脚本拷贝文件到系统内 files/docker-install.root.sh files/docker-install.www.sh


## 3 101-rootfs 干净纯净rootfs

```
docker pull gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs:latest
docker run -it gnuhub/10004-ubuntu-lts-2204-docker-101-rootfs:latest bash
```

## 3 root用户 安装一些常见包以及配置

```
docker pull gnuhub/10003-deepin-docker-beige-root:latest
docker run -it gnuhub/10003-deepin-docker-beige-root:latest bash
```

## 4 www安装一些常见包以及配置

```
docker pull gnuhub/10003-deepin-docker-beige-www:latest
docker run -it gnuhub/10003-deepin-docker-beige-www:latest bash
```

## 5 开发环境 快速启动

```
docker compose up -d 
# or
docker-compose up -d
```

1. 访问ssh
1. 访问管理面板
1. 访问vscode server
1. 访问桌面

## 6 账户密码 ssh以及桌面登陆 linux 面板

1. root -> opendde
1. www -> opendde
1. 管理面板 -->
   
