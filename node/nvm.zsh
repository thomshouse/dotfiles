#!/bin/zsh

nvm() {
    unset -f nvm 2> /dev/null
    unset -f node 2> /dev/null
    unset -f npm 2> /dev/null
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f nvm 2> /dev/null
    unset -f node 2> /dev/null
    unset -f npm 2> /dev/null
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f nvm 2> /dev/null
    unset -f node 2> /dev/null
    unset -f npm 2> /dev/null
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}
