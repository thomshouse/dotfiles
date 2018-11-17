#!/bin/zsh

# Test for php + composer
if (( $+commands[php] && $+commands[composer] )); then
    # List Global Packages to Install
    packages=(
        'squizlabs/php_codesniffer'
    )

    # Install packages
    for i in $packages; do
        composer global require $i || true
    done
fi
