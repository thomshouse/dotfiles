git() {
  if [ "$1" = top ]; then
    builtin cd `git rev-parse --show-toplevel`
  else
    command git "$@"
  fi
}

alias npm-generate-gitignore="cd node_modules 2> /dev/null && cd .. && echo '/*' > node_modules/.gitignore && echo '!/.gitignore' >> node_modules/.gitignore && npm ls --prod --parseable 2> /dev/null | grep node_modules | grep -vE 'node_modules.*node_modules' | sed 's/.*node_modules/!/' >> node_modules/.gitignore"