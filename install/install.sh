#!/usr/bin/env bash

# pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
if [ which python >/dev/null 2>&1 ]; then
  python get-pip.py
fi
if [ which python3 >/dev/null 2>&1 ]; then
  python3 get-pip.py
fi

getfzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
}

getohmyzsh(){
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

getnvm() {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
}


