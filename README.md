# terut's .dotfiles
terut's .dotfiles".

## Usage
Show the way for deploy following:
 
1. Clone this repository.
 
```
$ cd $HOME
$ git clone git@github.com:terut/dotfiles.git .dotfiles
$ cd .dotfiles/
$ ./deploy.sh
```

## Note

### Setup ssh key

```
$ mkdir -m 700 ~/.ssh
$ ssh-keygen -t rsa -b 4096 -C \"your_email@example.com\" -f ~/.ssh/id_rsa.xxx"
```

### Setup development directory

```
$ mkdir -p ~/Develop/projects/github.com
$ mkdir -p ~/Develop/go
```

### Setup vim

Install dein.vim to `~/.vim/bundles`.
See: https://github.com/Shougo/dein.vim

### Setup nvim

Install dein.vim to `~/.nvim/bundles`.
See: https://github.com/Shougo/dein.vim

### Setup ruby

Install rbenv to `~/.rbenv`.
See: https://github.com/rbenv/rbenv

### Setup node

Install nodenv to `~/.nodenv`.
See: https://github.com/nodenv/nodenv

### Setup golang

Install goenv to `~/.goenv`.
See: https://github.com/syndbg/goenv

### Setup ghq

Install ghq.
See: https://github.com/motemen/ghq

### Setup peco

Install peco.
See: https://github.com/peco/peco
