case ${OSTYPE} in
  darwin*)
    ## mac settings
    . ~/.dotfiles/.osx.zprofile
    ;;
  linux*)
    ## linux settings
    . ~/.dotfiles/.linux.zprofile
    ;;
esac

## grep
export GREP_COLOR="1;36"

EDITOR="vim"

## golang
if type go >/dev/null 2>&1; then
  export GOPATH="$HOME/Develop/local"
  export PATH="$GOPATH/bin:$PATH"
fi
## direnv
#if [ -x "`which direnv 2>/dev/null`" ]; then
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook $0)"
fi
## rbenv
if [ -e $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
## pyenv
if [ -e $HOME/.pyenv ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
## ndenv
if [ -e $HOME/.ndenv ]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi
## pyenv
if [ -e $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
## flutter
if [ -e $HOME/.flutter ]; then
  export PATH="$HOME/.flutter/bin:$PATH"
fi

#source /Users/terut/.pythonbrew/etc/bashrc
export AWS_CONFIG_FILE=~/.aws/config

## peco
function peco-src() {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^h' peco-select-history

function peco-pkill() {
    for pid in `ps aux | peco | awk '{ print $2 }'`
    do
        kill $pid
        echo "Killed ${pid}"
    done
}
alias pk="peco-pkill"

#function peco-cdr() {
#    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
#    if [ -n "$selected_dir" ]; then
#        BUFFER="cd ${selected_dir}"
#        zle accept-line
#    fi
#    zle clear-screen
#}
#zle -N peco-cdr
#bindkey '^a' peco-cdr

# bundle cd [gem]
_orig_bundle=$(which bundle)
function bundle() {
    if [ "$1" = "cd" ]; then
        local gem
        if [ "$2" ]; then
            gem=$2
        else
            gem=$($_orig_bundle list | awk '{ print $2 }' | peco)
        fi
        cd $($_orig_bundle show $gem)
    else
        $_orig_bundle $*
    fi
}

timer() {
	local N=$1; shift
	(sleep $N && notify-send "Time's Up" "${*:-Bing}" --icon=face-wink) &
	echo "timer set for $N"
}
