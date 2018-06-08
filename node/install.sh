if ! [ -e "$HOME/.nvm" ]; then
    NEW_NVM = 1;
fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "$NVM_DIR"

if [ -z "$NEW_NVM" ]; then
	nvm install --lts
	nvm alias default 'lts/*'
else
	nvm use --lts
	LTS_VERSION="$(nvm current)"
	nvm install --lts
	nvm reinstall-packages "$LTS_VERSION"
	nvm use default
fi
