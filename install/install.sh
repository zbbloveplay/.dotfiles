#!/usr/bin/env bash

# pip
getpip() {
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  if [ which python >/dev/null 2>&1 ]; then
    python get-pip.py
  fi
  if [ which python3 >/dev/null 2>&1 ]; then
    python3 get-pip.py
  fi
}

# fzf
getfzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
}
