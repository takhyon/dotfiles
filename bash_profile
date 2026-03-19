
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash"



if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

case "$OSTYPE" in
  darwin*)
    #
  ;;
  linux*)
    # export PATH="$HOME/.parts/autoparts/bin:$PATH"
    # eval "$(parts init -)"
  ;;
esac

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH=/Users/salrea/Library/Python/3.6/bin:$PATH
export PATH=$HOME/bin:$PATH

#OktaAWSCLI
if [ -f "/Users/salrea/.okta/bash_functions" ]; then
    . "/Users/salrea/.okta/bash_functions"
fi

export PATH=/Users/salrea/homebrew/bin:/Users/salrea/homebrew/sbin:/Users/salrea/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/usr/local/share/dotnet:~/.dotnet/tools:/Users/salrea/.rvm/bin:/Users/salrea:/Users/salrea/Workspace.ISE/chocopackages/helpful_files:/Users/salrea/Workspace.ISE/puppet/helpful_files:/Users/salrea/Workspace/helpful-files:/usr/local/go/bin:/usr/local/opt/awscli@1/bin:"/Applications/Sublime Text.app/Contents/SharedSupport/bin"

alias assume="source assume"

alias assume=". assume"



. "$HOME/.local/bin/env"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash"
