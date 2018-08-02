#!/bin/zsh

if [ -f "$HOME/.zgen/zgen.zsh" ]; then
  source "$HOME/.zgen/zgen.zsh"
fi

if (( $+commands[zgen] )); then
  zgen update
  zgen selfupdate
fi
