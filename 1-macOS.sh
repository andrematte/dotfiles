#!/usr/bin/env zsh

# ---------------------------------------------------------------------------- #
#                              MacOS Setup Script                              #
# ---------------------------------------------------------------------------- #

# ----------------------------- Change Wallpaper ----------------------------- #
IMAGE_PATH="${HOME}/dotfiles/settings/wallpaper.jpg"
osascript <<EOF
tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
        tell desktop desktopNumber
            set picture to "$IMAGE_PATH"
        end tell
    end repeat
end tell
EOF

# ------------------------ Reduce Dock Auto-Hide Delay ----------------------- #
defaults write com.apple.dock autohide-time-modifier -float 0.3;killall Dock

echo "MacOS Setup Complete!"


# --------------------- Install XCode Command Line Tools --------------------- #
xcode-select --install

echo "Complete the installation of XCode Command Line Tools"
echo "Press any key to continue..."
read


