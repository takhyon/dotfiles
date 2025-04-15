echo "~/.zshrc starting..."
# Disable auto updates for brew, it's too slow?
#export HOMEBREW_NO_AUTO_UPDATE=1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="gallois"
#ZSH_THEME="nanotech"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###
### aliases
###

alias ll="ls -la"
alias pro="java -jar /usr/local/bin/authproxy-1-201911111019-jar-with-dependencies.jar gui & > /dev/null 2>&1"
alias xclip=pbcopy
alias clip=pbcopy
alias flow=logs
alias tf=terraform
alias tf12=terraform12


###
### functions
###

logs(){
echo "| filter isIpv4InSubnet(srcAddr, \"$1\") and isIpv4InSubnet(dstAddr, \"$2\") or \n\
isIpv4InSubnet(srcAddr, \"$2\") and isIpv4InSubnet(dstAddr, \"$1\")"
}

###
### Bash function for git
###
git_all_in(){
git add . && git commit -m "$@" && git push
}

###
### Docker CLI tools path add
###
export PATH="${HOME}/workspace/gitlab/configs/docker-cli-tools/bin:$PATH"

###
### Set Ruby path to brew installed ruby to avoid conflict with macos own ruby 
###
export PATH="/usr/local/opt/ruby/bin:$PATH"

###
### Set HTTP and HTTPS proxy
###

# APAC Proxy1 = 103.7.147.1 (au04cbcsg01.org.nasdaqomx.com)
# APAC Proxy2 = 103.7.147.2 (au03cbcsg01.org.nasdaqomx.com)

#NADQ_PROXY_LOCATION="APAC"
#NADQ_PROXY="http://103.7.147.2:8080"
#NADQ_SSL_PROXY="http://103.7.147.2:8080"

#NADQ_PROXY_LOCATION="US"
#NADQ_PROXY="http://proxy-us01.org.nasdaqomx.com:8080"
#NADQ_SSL_PROXY="https://proxy-us01.org.nasdaqomx.com:8080"

NADQ_PROXY_LOCATION="EMEA"
NADQ_PROXY="http://se20cbcsg01.org.nasdaqomx.com:8080"
NADQ_SSL_PROXY="http://se20cbcsg01.org.nasdaqomx.com:8080"

## no proxy for these locations
#NADQ_NO_PROXY="localhost,127.0.0.1,localaddress,*localdomain.com,localdomain.com,*.local,*.internal,169.254/16,*.nasdaq.com,nasdaq.com,*nasdaqomx.com,nasdaqomx.com,*.smbc.nasdaqomx.com,tfe.ops.nadq2universalservices.gi.nadq.ci"
NADQ_NO_PROXY="localhost,127.0.0.1,localaddress,*localdomain.com,localdomain.com,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,*nasdaq.com,nasdaq.com,*nasdaqomx.com,nasdaqomx.com,*ften.com,ften.com,*om.com,om.com,*.om,.om,minikube,*.smbc.nasdaqomx.com,tfe.ops.nadq2universalservices.gi.nadq.ci"

###
### Attempt proxy authentication
###
proxy_authenticate() {
        echo "Attempting NTLM auth to $NADQ_PROXY as $USER"
        curl --fail-early -f -v -I -L --proxy-ntlm -U $USER -x $NADQ_PROXY www.google.com
        if [ $? -ne 0 ]; then
           echo ""
           echo "ERROR: unable to authenticate to proxy"
        else
           echo ""
           echo "Successfully authenticated with proxy"
        fi
        echo ""
}

###
### Get status of proxy settings
###
proxy_status() {
        if [[ -z $HTTP_PROXY ]]; then
                echo "Proxy DISABLED";
        else
                echo "Using HTTP/S_PROXY: $HTTP_PROXY"
        fi
}

###
### Enable proxy
###
proxy_enable() {
        export HTTP_PROXY=${NADQ_PROXY}
        export HTTPS_PROXY=${NADQ_SSL_PROXY}
        export http_proxy=${NADQ_PROXY}
        export https_proxy=${NADQ_SSL_PROXY}
        export NO_PROXY=${NADQ_NO_PROXY}
        export no_proxy=${NADQ_NO_PROXY}
        proxy_status
}

###
### Disable proxy
###
proxy_disable() {
        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset http_proxy
        unset https_proxy
        unset NO_PROXY
        unset no_proxy
        proxy_status
}

if [[ $HTTP_PROXY == ${NADQ_PROXY} && $HTTPS_PROXY == ${NADQ_SSL_PROXY} ]]; then
        #proxy is set, no edits necessary
        proxy_status
    else
        proxy_enable
fi

function adacctsearch ()
{

        ldapsearch sAMAccountName=$1 memberOf -oldif-wrap=no
}


###
### Autocompletion for azure cli
###
autoload -U +X bashcompinit && bashcompinit
source ~/.azure/completion.sh

###
### PYTHONPATH for local shared modules
###
export PYTHONPATH=/Users/paak/workspace/gitlab/personal/python/shared_modules
