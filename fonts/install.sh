#!/bin/zsh
#
# fonts
#
# Commands to run during installation 

git clone https://github.com/powerline/fonts.git "$TMPDIR/powerline-fonts"
find "$TMPDIR/powerline-fonts/SourceCodePro" -type f -name "*.otf" -exec cp {} ~/Library/Fonts \;
rm -rf "$TMPDIR/powerline-fonts"