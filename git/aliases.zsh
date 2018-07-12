#!/bin/zsh

git() {
  if [ "$1" = root ]; then
    builtin cd `git rev-parse --show-toplevel`
  else
    ISALIAS=$(command git --no-pager config --get-regexp "^alias\.$1\$");
    if [ -n "$ISALIAS" ]; then
	    ALIASARGS="";
	    for i in "${@:2}"; do
              ALIASARGS="$ALIASARGS $i";
	    done
	    ALIASOF="$(command git config alias.$1)";
	    if [[ "$ALIASOF" =~ "^!" ]]; then
	      ALIASOF="${ALIASOF#!}";
	    else
	      ALIASOF="git $ALIASOF";
	    fi;
	    dotfiles_git_format_command "$ALIASOF$ALIASARGS";
    fi
    command git "$@"
  fi
}

alias npm-generate-gitignore="cd node_modules 2> /dev/null && cd .. && echo '/*' > node_modules/.gitignore && echo '!/.gitignore' >> node_modules/.gitignore && npm ls --prod --parseable 2> /dev/null | grep node_modules | grep -vE 'node_modules.*node_modules' | sed 's/.*node_modules/!/' >> node_modules/.gitignore"

# Remove OMZ git/gitfast aliases and functions
unalias g ga gaa gapa gau gap gb gba gbd gbda gbl gbnm gbr gbs gbsb gbsg gbsr gbss gc gc! gcn! gca gca! gcan! gcans! gcam gcsm gcb gcf gcl gclean gpristine gcm gcd gcmsg gco gcount gcp gcpa gcpc gcs gd gdca gdcw gdct gdt gdw gf gfa gfo gg gga ggpur ggpull ggpush ggsup gpsup ghh gignore gignored git-svn-dcommit-push gk gke gl glg glgp glgg glgga glgm glo glol glod glods glola glog gloga glp gm gmom gmt gmtvim gmum gma gp gpd gpoat gpu gpv gr gra grb grba grbc grbd grbi grbm grbs grh grhh grmv grrm grset grt gru grup grv gsb gsd gsi gsps gsr gss gst gsta gstaa gstc gstd gstl gstp gsts gsu gts gtv gunignore gunwip gup gupv glum gwch gwip >/dev/null 2>&1
unfunction gdv gfg ggf ggfl ggl ggp ggpnp ggu >/dev/null 2>&1

dotfiles_git_verbalize() {
  params="$@";
  dotfiles_git_format_command $@;
  eval "$params";
}

dotfiles_git_format_command() {
  echo "  \$ \e[1m\e[97m$@\e[0m";
}

# Aliases to git commands
alias g="dotfiles_git_verbalize git"
alias ga="dotfiles_git_verbalize git add"
alias gb="dotfiles_git_verbalize git branch"
alias gcb="git checkout -b"
alias gch="dotfiles_git_verbalize git checkout"
alias gcm="dotfiles_git_verbalize git commit"
alias gd="dotfiles_git_verbalize git diff"
alias gf="dotfiles_git_verbalize git fetch"
alias gff="dotfiles_git_verbalize git merge --ff-only"
alias gm="dotfiles_git_verbalize git merge"
alias gp="dotfiles_git_verbalize git push"
alias gr="dotfiles_git_verbalize git remote"
alias gs="dotfiles_git_verbalize git status"
alias gup="dotfiles_git_verbalize git remote update -p; dotfiles_git_verbalize git merge --ff-only @{u}"

# Aliases to git aliases -- due to structure of commands
alias gffon="dotfiles_git_format_command \"git checkout <branch> && git merge --ff-only HEAD@{1} (last-branch)\"; git ffon"
alias {gpu,gpushu}="dotfiles_git_verbalize git pushu"
