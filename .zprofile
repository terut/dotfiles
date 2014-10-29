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
            gem=$($_orig_bundle list | awk '{ print $2 }' | percol)
        fi
        cd $($_orig_bundle show $gem)
    else
        $_orig_bundle $*
    fi
}

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;36"

EDITOR="vim"

## golang
if type go >/dev/null 2>&1; then
  export GOPATH="$HOME/Develop/enhancements"
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
## ndenv
if [ -e $HOME/.ndenv ]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi
#source /Users/terut/.pythonbrew/etc/bashrc
export AWS_CONFIG_FILE=~/.aws/config
