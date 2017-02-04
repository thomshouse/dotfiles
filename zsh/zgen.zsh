#!/bin/zsh

# Disable oh-my-zsh LS colors due to OSX issues -- dotfiles handles this anyhow
export DISABLE_LS_COLORS=true

# autostart tmux if installed
if (( $+commands[tmux] )); then
  export ZSH_TMUX_AUTOSTART=true
fi

DOTHOME=$ZSH

source "${HOME}/.zgen/zgen.zsh"
source "${DOTHOME}/zsh/gofish.zsh-theme"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/gitfast
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/ssh-agent

  # generate the init script from plugins above
  zgen save
fi

ZSH=$DOTHOME