#!/bin/zsh

lazyload_nvm() {
    unset -f nvm 2> /dev/null
    lazyload_nvm_get_commands | while read package ; do unset -f ${package} 2> /dev/null; done
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

lazyload_nvm_get_commands() {
    find ~/.nvm/versions/node -type d -name "bin" -maxdepth 2 | xargs -I {} ls -1 {} | cat | sort | uniq
}

nvm() {
    lazyload_nvm;
    nvm "$@"
}

lazyload_nvm_get_commands | while read package; do eval "${package}() { lazyload_nvm; ${package} \"\$@\" }"; done
