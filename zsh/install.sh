#!/bin/zsh
#
# ZSH
#
# Commands to run during installation 

# Set ZSH as default shell (assuming current shell is default shell)
if [[ -f "$(which zsh)" ]] && ! [[ "$SHELL" =~ "zsh" ]]
then
  echo "";
  chsh -s $(which zsh)
  echo "";
fi

# Install zgen (includes oh-my-zsh)
if [[ ! -e "$HOME/.zgen" ]]
then
  git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"
fi

# Override zgen directory aliases
if [[ -e "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/" ]]
then
  mkdir -p "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/lib"
  cp "zsh/zgen-omz-directories" "$HOME/.zgen/robbyrussell/oh-my-zsh-master/custom/lib/directories.zsh"
fi
