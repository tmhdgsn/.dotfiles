
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


alias t=tmux
alias g=git
alias bazel=bazelisk
alias b=bazel
alias k=kubectl
alias gst=git status
alias gd=git diff
alias gci=git commit
alias gco=git checkout
alias gps=git push
alias gpl=git pull
alias gcl=git clone
alias gbr=git branch
alias vim=nvim
alias python=python3


alias androidstudio="open -a /Applications/Android\ Studio.app"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tmhdgsn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tmhdgsn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tmhdgsn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tmhdgsn/google-cloud-sdk/completion.zsh.inc'; fi

PATH=$PATH:/Users/tmhdgsn/bin/flutter/bin
PATH="$PATH":"$HOME/.pub-cache/bin"
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"


# For compilers to find openjdk you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"


# For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh

export CHROMEDRIVER=/Users/tmhdgsn/bin/chromedriver


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/tmhdgsn/.opam/opam-init/init.zsh' ]] || source '/Users/tmhdgsn/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration



export GOPATH=/Users/tmhdgsn/go
PATH=$PATH:$GOPATH/bin
