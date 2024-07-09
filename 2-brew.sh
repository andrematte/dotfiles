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
    "font-jetbrains-mono-nerd-font"
    "python"
    "pipx"
    "pylint"
    "pyenv"
    "black"
    "node"
    "gifski"
    "mas"
    "atuin"
    "powerlevel10k"
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


# Add the Homebrew zsh to allowed shells
echo "Changing default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(brew --prefix)/bin/git config --global user.name "$git_user_name"
$(brew --prefix)/bin/git config --global user.email "$git_user_email"

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

# Update and clean up again for safe measure
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# ------------------------------- Manual Tasks ------------------------------- #

echo "Open BetterDisplay and activate license. Press enter to continue..."
read

echo "Open Rectangle and import the settings located in ~/dotfiles/settings/rectangle-config.json. Press enter to continue..."
read

echo "Open iTerm2 and set it up with the settings located at ~/dotfiles/settings/iterm2-config. Press enter to continue..."
read

echo "Open Visual Studio Code, log in and sync settings/extensions. Press enter to continue..."
read

echo "Open Obsidian and set the iCloud vault location. Press enter to continue..."
read

echo "Open Zotero, log in and setup syncing, install plugins (Better BibTeX, Zutilo, Night for Zotero). Press enter to continue..."
read
