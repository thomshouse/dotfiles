# ZSH Theme emulating the Fish shell's default prompt.

_gofish_collapsed_wd() {
  echo $(pwd | perl -pe "
   BEGIN {
      binmode STDIN,  ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
   }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g
")
}

_gofish_collapsed_host() {
	echo $(hostname | sed -E 's/^([Tt]he)[.-]//g' | sed 's/[.-].*//g')
}

_gofish_git_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

if [ "$DISABLE_AUTO_TITLE" != "true" ]; then
	#DISABLE_AUTO_TITLE=true
fi

function precmd {
	#if [ "$DISABLE_AUTO_TITLE" != "true" ]; then
	if [[ "$TERM" == "linux" ]]; then
		print -nR $'\033k'$(_gofish_collapsed_wd)$'\033'\\\

		print -nR $'\33]0;'$(whoami)@$(_gofish_collapsed_host)$'\a'
	fi
}

function preexec {
	emulate -L zsh
	local -a cmd; cmd=(${(z)1})
	#if [ "$DISABLE_AUTO_TITLE" != "true" ]; then
	if [[ "$TERM" == "linux" ]]; then
		print -nR $'\033k'$cmd[1]:t$'\033'\\\

		print -nR $'\33]0;'$cmd[2,-1]$'\a'

		title $cmd[1]:t "$cmd[2,-1]"
	fi
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
PROMPT='%n@$(_gofish_collapsed_host) %{$fg[$user_color]%}$(_gofish_collapsed_wd)%{$reset_color%}$(_gofish_git_info)%(!.#.>) '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}("

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
