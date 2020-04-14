#!/bin/bash
# 这个脚本用于给ubuntu安装fish并简单配置
set -e

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

curl -L https://get.oh-my.fish | fish

omf install sashimi

