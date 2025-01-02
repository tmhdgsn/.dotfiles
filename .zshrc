autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# history settings
HISTFILE=~/.zsh_history              # Path to the history file
HISTSIZE=100000                      # Number of commands to keep in memory
SAVEHIST=100000                      # Number of commands to save to HISTFILE
setopt appendhistory                 # Append new history to the file, don't overwrite
setopt sharehistory                  # Share history between all sessions
setopt incappendhistory              # Write to history file incrementally
setopt histignoredups                # Ignore duplicate commands
setopt histreduceblanks              # Remove unnecessary blank lines

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

# Platform detection
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS-specific aliases and configurations
  alias androidstudio="open -a /Applications/Android\ Studio.app"

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/tmhdgsn/google-cloud-sdk/path.zsh.inc' ]; then
    . '/Users/tmhdgsn/google-cloud-sdk/path.zsh.inc'
  fi

  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/tmhdgsn/google-cloud-sdk/completion.zsh.inc' ]; then
    . '/Users/tmhdgsn/google-cloud-sdk/completion.zsh.inc'
  fi

  PATH=$PATH:/Users/tmhdgsn/bin/flutter/bin
  PATH="$PATH":"$HOME/.pub-cache/bin"
  
  # Homebrew and OpenJDK
  export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

  # For the system Java wrappers to find this JDK, symlink it with
  # sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

  export CHROMEDRIVER=/Users/tmhdgsn/bin/chromedriver

  # virtualenv
  VIRTUALENVWRAPPER_PYTHON=$(which python3)
  export WORKON_HOME=$HOME/.virtualenvs
  source /opt/homebrew/bin/virtualenvwrapper.sh

  # Opam
  [[ ! -r '/Users/tmhdgsn/.opam/opam-init/init.zsh' ]] || source '/Users/tmhdgsn/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

  # golang
  export GOPATH=/Users/tmhdgsn/go
  PATH=$PATH:$GOPATH/bin
else
  # linux config
fi

