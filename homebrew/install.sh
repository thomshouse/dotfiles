#!/bin/zsh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if ! (( $+commands[brew] ))
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if [[ "$(uname)" = "Darwin" ]]
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  #then
    #ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

exit 0
