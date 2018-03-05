#!/bin/zsh

if (( $+commands[magento-cloud] )); then
  vagrant global-status | awk '/running/{print $1}' | xargs -I {} vagrant suspend {};
fi
