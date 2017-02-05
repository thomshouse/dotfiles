#!/bin/zsh
#
# tmux
#
# Commands to run during installation 

if [[ ! -e "$HOME/.tmux-powerline" ]]
then
  git clone https://github.com/erikw/tmux-powerline.git "$HOME/.tmux-powerline"
fi

cp "tmux/powerline-theme" "$HOME/.tmux-powerline/themes/thomshouse-dotfiles.sh"