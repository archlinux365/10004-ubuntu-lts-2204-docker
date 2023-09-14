# 10003-deepin-docker

## 0 目标

1. docker镜像: rootfs ci 开发 root以及www用户
1. ci镜像配置用户和基础工具链
1. ssh docker服务
1. vnc桌面
1. vscode server
1. linux管理面板
1. 进程管理

## 1 文件夹说明

1. beige 构建基础rootfs
1. beige-root 继承 beige镜像 安装配置
1. beige-www 继承 beige-root镜像 安装配置

## 2 开发指南

1. 放文件独立脚本 beige-root-->files
1. 调用脚本拷贝文件到系统内 beige-root-->files/docker-install.root.sh
1. 放文件独立脚本 beige-www-->files
1. 调用脚本拷贝文件到系统内 beige-www-->files/docker-install.www.sh

## 3 beige 干净纯净rootfs

```
docker pull gnuhub/10003-deepin-docker-beige:latest
docker run -it gnuhub/10003-deepin-docker-beige:latest bash
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