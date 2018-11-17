#!/bin/zsh

# Test for code command
if (( $+commands[code] )); then
    # List Extensions to Install
    extensions=(
    )
    # List Extensions to Uninstall
    uninstall_extensions=(
    )

    # Install extensions
    for i in $extensions; do
        code --install-extension $i || true
    done

    # Uninstall extensions
    for i in $uninstall_extensions; do
        code --uninstall-extension $i || true
    done

    # User Node script to merge settings
    ./settings/merge-settings
fi
