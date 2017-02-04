#!/bin/zsh
#
# Vagrant
#
# This script installs the plugin(s) I typically use with Vagrant

# Check for Homebrew
if [ $(vagrant plugin list | grep hostsupdater | wc -l) -ne 0 ]
then
  vagrant plugin install vagrant-hostsupdater
fi

exit 0
