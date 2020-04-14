#!/usr/bin/env bash
set -e

CURRENT_DIR=$(realpath $(dirname "$BASH_SOURCE"))

# Use array instead of map cause bash < 4 do not supprot
# associated array
LINK_PAIRS=(
    "$CURRENT_DIR/ranger | ~/.config/ranger"
    "$CURRENT_DIR/tmux/tmux.conf | ~/.tmux.conf"
    "$CURRENT_DIR/git/gitconfig | ~/.gitconfig"
    "$CURRENT_DIR/git/gitignore_global | ~/.gitignore_global"
)

function err() {
  echo $* >&2
  exit
}

# 链接单独的文件
function linkfile() {
  if [ $# -ne 2 ]; then
    err "Argument number must be equal 2"
  fi

  src=$1
  dst=$2
  #echo "src: $src"
  #echo "dst: $dst"
  #[ -e $src ] && echo "$src exist" || echo "$src no exist"
  #[ -L $dst ] && echo "$dst exist" || echo "$dst no exist"
  if [ -L $dst ] || [ -e $dst ]; then

    rm -rf $dst

#    read -p "Can you remove it?[y/N]: " canrm
#    case $canrm in
#      y)
#        ;&
#      Y)
#        rm -rf $dst
#        echo "remove $dst SUCCESS."
#        ;;
#      *)
#        echo "You choose don't remove $dst ant exit."
#        exit 1
#        ;;
#    esac
  fi

  ln -s $src $dst
  echo "Link $(basename $src) to $dst success."
}

# 链接整个目录
function addlinks() {
    if [[ $# -ne 2 ]]; then
      err "Argument number must be equal 2"
    fi

    src=$1
    dst=$2
    if [[ ! -d $src ]]; then
        err "$src must be a dir"
    fi

    for file in $(ls $src); do
        link_pair="$src/$file | $dest/$file"
        LINK_PAIRS+=("$link_pair")
    done
}

echo "Start to create symbolic link..."

for pair in "${LINK_PAIRS[@]}"; do
    src=$(echo $pair | awk -F'|' '{print $1}' | awk '{$1=$1};1')
    dst=$(echo $pair | awk -F'|' '{print $2}' | awk '{$1=$1};1')
#    echo "src: $src, dst: $dst"
    # expand tilde
    eval src=$src
    eval dst=$dst
    linkfile $src $dst
done

echo "Done." 
