export COMPOSER_HOME=$HOME/.config/composer
export COMPOSER_CACHE_DIR=$COMPOSER_HOME/cache
if [ -f $COMPOSER_HOME/auth.json ]; then
    export COMPOSER_AUTH=$(cat $COMPOSER_HOME/auth.json)
fi
