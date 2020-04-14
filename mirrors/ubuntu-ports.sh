#!/usr/bin/env bash
# 替换arm64架构的ubuntu镜像源

# 先备份一下
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bk

# 替换为阿里源
sudo sed -i "s/ports.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
