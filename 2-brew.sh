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
    "python"
    "pylint"
    "pyenv"
    "black"
    "node"
    "gifski"
    "mas"
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
    "chatgpt"
    "discord"
    "drawio"
    "figma"
    "google-chrome"
    "obsidian"
    "vlc"
    "zotero"
    
    # Development
    "devtoys"
    "docker"
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
    "logi-options-plus" 
    "maccy"
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

# --------------------------- Install App Store Apps -------------------------- #
appstore=(
    "1440147259"  #AdGuard for Safari
    "409183694"   #Keynote
    "408981434"   #iMovie
    "1438243180"  #Dark Reader for Safari
    "409201541"   #Pages
    "1147396723"  #WhatsApp
    "747648890"   #Telegram
    "360593530"   #Notability
    "1233965871"  #ScreenBrush
    "409203825"   #Numbers
    "1611378436"  #Pure Paste
    "1482490089"  #Tampermonkey
    "1534275760"  #LanguageTool
    "1355679052"  #Dropover

)

for app in "${appstore[@]}"; do
    echo "Installing $app from the App Store..."
    mas install "$app"
done

#TODO Apps that must be downloaded manually
# Language Tool Desktop Manually -> https://languagetool.org/
#TODO Install jetbrains font
#TODO Configureohmyzsh, Powerlevel10k, etc.
#TODO Add Miniconda/Python installation
# Add PyEnv to PATH
#TODO Follow Corey's repository from font-installation onwards