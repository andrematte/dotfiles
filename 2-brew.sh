#!/usr/bin/env zsh

# ---------------------------------------------------------------------------- #
#                                Homebrew Setup                                #
# ---------------------------------------------------------------------------- #

# ----------------------------- Install Homebrew ----------------------------- #

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not installed. Installing Homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Attempt to set up Homebrew PATH automatically for this session
    if [ -x "/opt/homebrew/bin/brew" ]; then
        # For Apple Silicon Macs
        echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
        export PATH="/opt/homebrew/bin:$PATH"
    fi
else
    echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
    echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
    exit 1
fi

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# ----------------------------- Install Packages ----------------------------- #
packages=(
    "bash"
    "zsh"
    "git"
    "tree"
    "pylint"
    "black"
    "node"
    "gifski"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

# --------------------------- Install Applications --------------------------- #
# Define an array of applications to install using Homebrew Cask.
apps=(
    # Apps
    "discord"
    "figma"
    "gimp"
    "google-chrome"
    "obsidian"
    "vlc"
    "zotero"
    
    # Development
    "devtoys"
    "inkscape"
    "insomnia"
    "iterm2"
    "visual-studio-code"

    # Tools
    "alt-tab"
    "appcleaner"
    "betterdisplay"
    "command-x"
    "coteditor"
    "hiddenbar"
    "keka"
    "keyboardcleantool"
    "keyclu"
    "logi-options-plus" 
    "maccy"
    "menubarx"
    "rectangle"
    "shottr"
    "stats"
)


# Loop over the array to install each application.
for app in "${apps[@]}"; do
    if brew list --cask | grep -q "^$app\$"; then
        echo "$app is already installed. Skipping..."
    else
        echo "Installing $app..."
        brew install --cask "$app"
    fi
done

#TODO Add App Store Applications to Download
#"appstore" DarkReader for Safari, AdGuard for Safari, Dropover,
# LanguageTool, LanguageTool for Desktop, Notability, PurePaste,
# Tampermonkey 

#TODO Install jetbrains font
#TODO Configureohmyzsh, Powerlevel10k, etc.
#TODO Add Miniconda/Python installation
#TODO Add sign in prompts to every application

#TODO Follow Corey's repository from font-installation onwards