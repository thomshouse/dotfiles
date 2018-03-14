#!/bin/zsh
#
# fonts
#
# Commands to run during installation 

if [ $(find ~/Library/Fonts -name "Source Code Pro*" | wc -l) -eq 0 ]; then
  git clone https://github.com/powerline/fonts.git "$TMPDIR/powerline-fonts"
  find "$TMPDIR/powerline-fonts/SourceCodePro" -type f -name "*.otf" -exec cp {} ~/Library/Fonts \;
  rm -rf "$TMPDIR/powerline-fonts"
fi
