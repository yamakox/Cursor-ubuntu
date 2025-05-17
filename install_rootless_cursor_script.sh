#!/bin/bash

installCursor() {
    # Check curl is installed
    if ! command -v curl &> /dev/null; then
        echo "curl is not installed. Please install it first:"
        echo "sudo apt-get update && sudo apt-get install -y curl"
        exit 1
    fi
    
    # Paths for installation
    APPIMAGE_PATH="$HOME/.local/bin/Cursor.AppImage"
    ICON_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/icons/cursor-icon.png"
    DESKTOP_ENTRY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/applications/Cursor.desktop"

    # Default values
    DEFAULT_CURSOR_PATH="$(ls -t $HOME/Downloads/Cursor*.AppImage | head -n 1)"
    DEFAULT_ICON_NAME="cursor-black-icon.png"

    echo "Installing Cursor AI IDE on Ubuntu..."

    # 📝 Enter the downloaded Cursor.AppImage path
    read -p "Enter the downloaded Cursor.AppImage path (default: $DEFAULT_CURSOR_PATH): " CURSOR_PATH
    CURSOR_PATH="${CURSOR_PATH:-$DEFAULT_CURSOR_PATH}"

    # 📝 Enter the icon file name (e.g., cursor-icon.png or cursor-black-icon.png)
    read -p "Enter the icon filename from GitHub (default: $DEFAULT_ICON_NAME): " ICON_NAME
    ICON_NAME="${ICON_NAME:-$DEFAULT_ICON_NAME}"

    # for Cursor Icon
    ICON_URL="https://raw.githubusercontent.com/hieutt192/Cursor-ubuntu/main/images/$ICON_NAME"

    # Create install directory if not exists
    mkdir -p $(dirname $APPIMAGE_PATH)
    mkdir -p $(dirname $ICON_PATH)
    mkdir -p $(dirname $DESKTOP_ENTRY_PATH)

    # Copy Cursor AppImage
    echo "copy Cursor.AppImage to $(dirname $APPIMAGE_PATH) folder..."
    if ! cp -i "$CURSOR_PATH" "$APPIMAGE_PATH"; then
        echo "Error: Failed to copy Cursor.AppImage to $(dirname $APPIMAGE_PATH) folder."
        exit 1
    fi
    chmod +x $APPIMAGE_PATH

    # Download Cursor icon
    echo "Downloading Cursor icon..."
    if ! curl -L $ICON_URL -o $ICON_PATH; then
        echo "Error: Failed to download Cursor icon."
        exit 1
    fi

    # Create a .desktop entry for Cursor
    echo "Creating .desktop entry for Cursor..."
    sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

    echo "✅ Cursor AI IDE installation complete. You can find it in your application menu."
    echo "If you want cursor command, you can add it to your .bashrc file:"
    echo "alias cursor='\$HOME/.local/bin/Cursor.AppImage --no-sandbox'"
}

installCursor
