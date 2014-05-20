# terut's .dotfiles
terut's .dotfiles".

## Usage
Show the way for deploy following:
 
1. Clone this repository.
 
```
$ cd $HOME
$ git clone git@github.com:terut/dotfiles.git .dotfiles
$ cd .dotfiles/
```
 
1. Clone vundle as submodule. 
 
```
$ git submodule init
$ git submodule update
$ cd .vim/vundle/
```
 
1. Checkout master branch from (no branch) of vundle.
  
```
$ git branch
$ git checkout master
$ git branch
```

1. Run `vim` and `:BundleInstall` for vim-plugin install.
 
```
$ vim
  :BundleInstall
```

1. Setting golang

```
$ brew install go
$ mkdir ~/.go/1.2.2/bin
$ go get github.com/nsf/gocode
$ go get github.com/go-sql-driver/mysql
```
