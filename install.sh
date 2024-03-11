#!/usr/bin/env zsh

# ---------------------------------------------------------------------------- #
#                                 Setup Script                                 #
# ---------------------------------------------------------------------------- #

# 1. Setup MacOS 
# 2. Setup Homebrew and install packages
# 3. Install Python / Miniconda
# 4. Setup Visual Studio Code

# -------------------------- Creating Symbolic Links ------------------------- #

DOTFILES_DIR="$HOME/dotfiles"

# List of files/folders to symlink in ${HOME}
FILES=(zshrc zprofile zprompt bashrc bash_profile bash_prompt aliases private)
cd ${DOTFILES_DIR} || exit

# Create symlinks
for file in ${FILES[@]}; do
    echo "Creating symlink to ${file} in home directory."
    ln -sfn ${DOTFILES_DIR}/.${file} ${HOME}/.${file}
done

# --------------------------- Running Setup Scripts -------------------------- #

./macOS.sh
./brew.sh
./python.sh
./vscode.sh

echo "Installation Complete!"