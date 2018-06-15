#!/bin/zsh

# Prompt to create id_rsa key-pair if it does not exist
if [[ ! -e ~/.ssh/id_rsa ]]; then
  while true; do
    read "yn?No SSH key (~/.ssh/id_rsa) found. Do you wish to create one? (Yn) "
    case $yn in
      Y|y|yes|"" )
        GITUSEREMAIL=$(git config user.email);
        if [[ -n "$GITUSEREMAIL" ]]; then
          ssh-keygen -t rsa -C "$GITUSEREMAIL";
        else
          read "USEREMAIL?Please enter your email address: "
          ssh-keygen -t rsa -C "$USEREMAIL";
        fi
        break;;
      N|n|no )
        break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
fi

# Attempt to use homebrew "keychain" utility for ssh-agent
if [[ $+commands[keychain] && -e ~/.ssh/id_rsa ]]; then
  eval `keychain --quiet --nogui --eval --agents ssh --inherit any id_rsa`;
fi
