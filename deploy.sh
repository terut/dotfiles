#!/bin/sh
## color
ESC="\e["
ESCEND="m"
COLOR_RESET="${ESC}${ESCEND}"

## check OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

## deploy directory
DEPLOY_TO=$HOME
#DEPLOY_TO=$PWD

## deploy minimum files.
DOTFILES=('.gemrc' '.irbrc' '.tmux.conf' '.tmux.ext' '.vim' '.vimrc' '.zprofile' '.zshrc')

if [ "$OS" == "Linux" ]; then
  DOTFILES+=('.config/devilspie2')
elif [ "$OS" == "Mac" ]; then
  echo ""
  #DOTFILES+=('20-middle-mouse-button.conf')
fi

## move current for .sh.
cd $(dirname $0)

deploy() {
  local dotfile
  for dotfile in ${DOTFILES[@]}
  do
    create_symlink $dotfile
  done
}

backup() {
  local dotfile=$1
  local dest="$DEPLOY_TO/$dotfile"
  local backupfile="$dest.default"
  if [ -e $dest ] && [ ! -L $dest ]; then
    if [ ! -e $backupfile ]; then
      log_info "backup original $dotfile to $backupfile"
      mv -i $dest $backupfile
    fi
  fi
}

create_symlink() {
  local dotfile=$1
  local dest=$DEPLOY_TO
  local dotdir=$(dirname $dotfile)
  local filename=$(basename $dotfile)
  if [ "$dotdir" != '.' ]; then
    dest="$dest/$dotdir"
    mkdir -p $dest
  fi

  backup $dotfile

  if [ ! -L "$dest/$filename" ]; then
    log_info "create symlink for $dotfile to $dest"
    ln -is "$PWD/$dotfile" $dest
  fi
}

log_info() {
  local message=$1
  # fontcolor;effect;background
  # e.g) 31;4;43, 4;43, 31;43
  # macOS can't use echo -e. echo depends on environment, so use printf
  printf "${ESC}32${ESCEND}[INFO] ${message}${COLOR_REST}\n"
}

log_alert() {
  local message=$1
  printf "${ESC}33${ESCEND}[INFO] ${message}${COLOR_REST}\n"
}

log_error() {
  local message=$1
  printf "${ESC}31${ESCEND}[INFO] ${message}${COLOR_REST}\n"
}

deploy
