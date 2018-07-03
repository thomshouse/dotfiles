#!/bin/zsh
#
# ZSH
#
# Commands to run during installation 

# TODO: If we have ZSH, let there be ZSH
#if (( $+commands[zsh] && ! $+ZSH_NAME ))
#then
  #chsh -s $(which zsh)
#fi

if [[ ! -e "$HOME/.zgen" ]]
then
  git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"
fi

if [[ -e "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/" ]]
then
  mkdir -p "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/lib"
  cp "zsh/zgen-omz-directories" "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/lib/directories.zsh"
fi
