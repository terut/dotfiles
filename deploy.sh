#!/bin/sh
## move current for .sh.
cd $(dirname $0)

## except .git .gitignore .gitmodules .profile .vimperatorrc README.md deploy.sh specs.watchr
dotfiles=('.bashrc' '.gemrc' '.irbrc' '.tmux.conf' '.tmux.ext' '.vim' '.vimrc' '.zprofile' '.zshrc' 'Rakefile' '20-middle-mouse-button.conf')

## all file version.
# for dotfile in .?*
for dotfile in ${dotfiles}
do
    ## all file version.
    # if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    # then
    ln -is "$PWD/$dotfile" $HOME
    # fi
done

# .gemrc, .irbrc, .tmux.conf, .tmux.ext, .vimrc, .zprofile, .zshenv, .zshrc
