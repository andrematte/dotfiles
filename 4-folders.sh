#!/usr/bin/env zsh

# ----------------------- Create Main Folder Structure ----------------------- #
# Base directory (user's home directory)
PROGRAMMING_DIR="$HOME/Programming"

# List of directories to create
DIRECTORIES=(
    "Applications"
    "Latex"
    "Playground"
    "Projects"
    "Repositories"
    "Scripts"
    "Sketch"
    "Templates"
    "Utilities"
)

# Create the base directory if it doesn't exist
if [ ! -d "$PROGRAMMING_DIR" ]; then
    mkdir -p "$PROGRAMMING_DIR"
    echo "Created base directory: $PROGRAMMING_DIR"
fi

# Create each directory in the list
for DIR in "${DIRECTORIES[@]}"; do
    DIR_PATH="$PROGRAMMING_DIR/$DIR"
    if [ ! -d "$DIR_PATH" ]; then
        mkdir -p "$DIR_PATH"
        echo "Created directory: $DIR_PATH"
    else
        echo "Directory already exists: $DIR_PATH"
    fi
done

echo "Directory structure created successfully."