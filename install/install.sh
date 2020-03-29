#!/usr/bin/env bash
# 这个脚本的目的上快速安装一些常用软件
# 01 扫描系统中的命令，看有哪些软件需要安装
# 02 选择要安装的软件
# 03 再次扫描系统中的软件，确认软件安装成功
#set -e

SAFTWARE_HUB=(
  "pip" 
  "fzf" 
  "ohmyzsh" 
  "nvm"
)

for SAFTWARE in ${SAFTWARE_HUB[@]}
do
  type $SAFTWARE 
  if [ $? -ne 0 ]
  then
    echo "$SAFTWARE 不存在，需要安装。"
  fi
done



# pip
#getpip() {
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#if [ which python >/dev/null 2>&1 ]; then
#  python get-pip.py
#fi
#if [ which python3 >/dev/null 2>&1 ]; then
#  python3 get-pip.py
#fi
#}

#getfzf() {
#  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#}
#
#getohmyzsh(){
#  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#}
#
#getnvm() {
#  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
#}
#
#
