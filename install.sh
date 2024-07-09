#!/usr/bin/env zsh

# ---------------------------------------------------------------------------- #
#                                 Setup Script                                 #
# ---------------------------------------------------------------------------- #

# 0. Create Symlinks
# 1. Setup MacOS 
# 2. Setup Homebrew and install packages
# 3. Setup dev tools

# -------------------------- Creating Symbolic Links ------------------------- #

DOTFILES_DIR="$HOME/dotfiles"

# List of files/folders to symlink in ${HOME}
# FILES=(zshrc zprofile zprompt bashrc bash_profile bash_prompt aliases private)
FILES=(zshrc)
cd ${DOTFILES_DIR} || exit

# Create symlinks
for file in ${FILES[@]}; do
    echo "Creating symlink to ${file} in home directory."
    ln -sfn ${DOTFILES_DIR}/.${file} ${HOME}/.${file}
done

# ------------------------------ Install OhMyZsh ----------------------------- #
# Check if Zsh is installed
if ! command_exists zsh; then
    echo "Zsh is not installed. Please install Zsh and run this script again."
    exit 1
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change the default shell to Zsh
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Changing the default shell to Zsh..."
    chsh -s "$(command -v zsh)"
fi

# --------------------------- Running Setup Scripts -------------------------- #

./1-macOS.sh
./2-brew.sh
./3-dev.sh
./4-folders.sh

echo "Installation Complete!"