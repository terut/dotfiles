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

1. Setup ssh key.

```
$ mkdir -m 700 ~/.ssh
$ ssh-keygen -t rsa -b 4096 -C \"your_email@example.com\" -f ~/.ssh/id_rsa.xxx"
```
1. Setup development directory.

```
$ mkdir -p ~/Develop/projects/github.com
$ mkdir -p ~/Develop/go
```

1. Setup vim.

Install dein.vim to `~/.vim/bundles`.
See: https://github.com/Shougo/dein.vim

1. Setup nvim.

Install dein.vim to `~/.nvim/bundles`.
See: https://github.com/Shougo/dein.vim

1. Setup ruby.

Install rbenv to `~/.rbenv`.
See: https://github.com/rbenv/rbenv

1. Setup node.

Install nodenv to `~/.nodenv`.
See: https://github.com/nodenv/nodenv

1. Setup golang.

Install goenv to `~/.goenv`.
See: https://github.com/syndbg/goenv

1. Setup ghq.

Install ghq.
See: https://github.com/motemen/ghq

1. Setup peco.

Install peco.
See: https://github.com/peco/peco
