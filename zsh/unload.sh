#!/bin/zsh

if [ -z "$ZGEN_INIT" ]; then
  ZGEN_INIT="$HOME/.zgen/init.zsh";
fi
if [[ -f "${ZGEN_INIT}" ]]
then
  echo "Deleting \"${ZGEN_INIT}\" ..."
  rm "${ZGEN_INIT}"
fi
