#sour[ -z "$PS1" ] && return

source ~/.git-completion.bash
source ~/.git-prompt.sh
set -o vi

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
YELLOW_BOLD="\[\033[1;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
CYAN_BOLD="\[\033[01;36m\]"
GREEN="\[\033[0;32m\]"
GREEN_BOLD="\[\033[1;32m\]"
WHITE="\[\033[00m\]"

case "$OSTYPE" in
  darwin*)
    alias ls='ls -GF'
    alias ll='ls -lah'
    alias mate='~/bin/mate'
    alias vi='vim'
    alias kc='kubectl'
    export LSCOLORS=GxFxCxDxBxegedabagaced
    export EDITOR='mate -w'i
#   export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
  ;;
linux*)
    LS_COLORS=$LS_COLORS:'di=1;35:' ; export LS_COLORS
    alias ls='ls -F --color=auto'
    alias ll='ls -lah'
    alias vi='vim'
  ;;
esac

function parse_git_dirty {
  git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='vim'
alias cd..='cd ..'
alias cd~='cd ~'
alias ppcd='cd ~/workspace/puppet/'
alias cdr='cd $(git rev-parse --show-toplevel)'

export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=UTF-8
export PS1="${GREEN_BOLD}takhyon:$CYAN_BOLD\W$WHITE\$(parse_git_branch)\$ "
export PS2="${YELLOW_BOLD}continue-> "

# COOP PROXY STUFF
#export http_proxy=http://us02cbcsg01.org.nasdaqomx.com:8080/
#export https_proxy=${http_proxy}
#export HTTP_PROXY=${http_proxy}
#export HTTPS_PROXY=${http_proxy}
#export no_proxy="localhost, 127.0.0.1, localaddress, *localdomain.com, localdomain.com, *.local, 169.254/16, *.nasdaq.com, nasdaq.com, *nasdaqomx.com, nasdaqomx.com, *ften.com, tfe.ops.nadq2universalservices.gi.nadq.ci, psregistry.ndaquniversalservices.com"
#export NO_PROXY=${no_proxy}

HISTSIZE=500
HISTFILESIZE=500
HISTFILE=$HOME/.bash_history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

PATH=$PATH:$HOME/.rvm/bin:$HOME:$HOME/Workspace.ISE/chocopackages/helpful_files:$HOME/Workspace.ISE/puppet/helpful_files:$HOME/Workspace/helpful-files:/Users/salrea/go/bin:/usr/local/opt/awscli@1/bin # Add RVM to PATH for scripting

#export EDITOR="/usr/local/bin/mate -w"
