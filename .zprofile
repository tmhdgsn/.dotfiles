export EDITOR='vim'
export LANG=en_GB.UTF-8

# nix on macos blog post: https://checkoway.net/musings/nix/
# Add paths to PATH.
if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  export NIX_PATH="$HOME/.nix-defexpr"
fi

export PATH=~/bin:$PATH


eval "$(/opt/homebrew/bin/brew shellenv)"
