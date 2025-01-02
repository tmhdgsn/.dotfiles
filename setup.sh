#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

# figure out where we are
PLATFORM=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="Linux"
else
    echo "Unsupported platform: $OSTYPE"
    exit 1
fi

echo "Detected platform: $PLATFORM"


# clone dotfiles
if [[ ! -d "$DOTFILES_DIR" ]]; then
    read -p "Enter the URL of your dotfiles repository: " REPO_URL
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi


echo "Updating the following dotfiles:"
cd "$DOTFILES_DIR"

for FILE in .*; do
  [[ "$FILE" == "." || "$FILE" == ".." || "$FILE" == ".git" ]] && continue
  TARGET="$HOME/$FILE"

  if [[ -e "$TARGET" ]]; then
        read -p "Overwrite $TARGET? (y/n) " CONFIRM
        if [[ "$CONFIRM" != "y" ]]; then
            echo "Skipping $TARGET"
            continue
        fi
  fi

  ln -sf "$DOTFILES_DIR/$FILE" "$TARGET"
  echo "Linked $TARGET -> $DOTFILES_DIR/$FILE"

done

# If neovim is installed, configure it
NEOVIM_CONFIG_DIR="$HOME/.config/nvim"
if command -v nvim >/dev/null 2>&1; then
    echo "NeoVim detected. Setting up."
    mkdir -p "$NEOVIM_CONFIG_DIR"

    for CONFIG_FILE in "$DOTFILES_DIR/nvim"/*; do
        CONFIG_BASENAME=$(basename "$CONFIG_FILE")
        TARGET="$NEOVIM_CONFIG_DIR/$CONFIG_BASENAME"

        if [[ -e "$TARGET" ]]; then
            read -p "Overwrite $TARGET? (y/n) " CONFIRM
            if [[ "$CONFIRM" != "y" ]]; then
                echo "Skipping $TARGET"
                continue
            fi
        fi

        ln -sf "$CONFIG_FILE" "$TARGET"
        echo "Linked $TARGET -> $CONFIG_FILE"
    done
fi

# If skhd is installed, configure it
SKHD_CONFIG_DIR="$HOME/.config/skhd"
if command -v skhd >/dev/null 2>&1; then
    echo "skhd detected. Setting up."
    mkdir -p "$SKHD_CONFIG_DIR"

    for CONFIG_FILE in "$DOTFILES_DIR/skhd"/*; do
        CONFIG_BASENAME=$(basename "$CONFIG_FILE")
        TARGET="$SKHD_CONFIG_DIR/$CONFIG_BASENAME"

        if [[ -e "$TARGET" ]]; then
            read -p "Overwrite $TARGET? (y/n) " CONFIRM
            if [[ "$CONFIRM" != "y" ]]; then
                echo "Skipping $TARGET"
                continue
            fi
        fi

        ln -sf "$CONFIG_FILE" "$TARGET"
        echo "Linked $TARGET -> $CONFIG_FILE"
    done
fi


echo "Dotfiles Setup!"
