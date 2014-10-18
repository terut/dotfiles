#export PATH=$PATH:/usr/local/mysql/bin
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;36"

EDITOR="vim"

# golang
if [ -e $HOME/.go ]; then
  export GOPATH=:"$HOME/.go/1.2.2"
  export PATH="$GOPATH/bin:$PATH"
fi
# direnv
if [ -x "`which direnv 2>/dev/null`" ]; then
  eval "$(direnv hook zsh)"
fi
# rbenv
if [ -e $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# ndenv
if [ -e $HOME/.ndenv ]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi
