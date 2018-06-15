#!/bin/zsh

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

# Grab lunchy because launchctl is annoying
gem list -i "^lunchy$" > /dev/null 2>&1;
if (( $? ))
then
  echo "› gem install lunchy"
  gem install lunchy
fi
