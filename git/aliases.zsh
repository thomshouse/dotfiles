git() {
	if [ "$1" = top ]; then
    builtin cd `git rev-parse --show-toplevel`
  else
    command git "$@"
  fi
}