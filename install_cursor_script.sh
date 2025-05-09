#!/bin/bash

installCursor() {
    if ! [ -f /opt/Cursor/cursor.appimage ]; then
        echo "Installing Cursor AI IDE on Ubuntu 22.04..."

        # 📝 Enter the AppImage download URL
        read -p "Enter Cursor AppImage URL (Download file .AppImage from https://www.cursor.com/downloads): " CURSOR_URL
        # 📝 Enter the icon file name (e.g., cursor-icon.png or cursor-black-icon.png)
        read -p "Enter icon filename (from GitHub): " ICON_NAME

        # for Cursor Icon
        ICON_URL="https://raw.githubusercontent.com/hieutt192/Cursor-ubuntu/main/images/$ICON_NAME"

        # Paths for installation
        APPIMAGE_PATH="/opt/Cursor/cursor.appimage"
        ICON_PATH="/opt/Cursor/cursor-icon.png"
        DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

        # Install curl if not installed
        if ! command -v curl &> /dev/null; then
            echo "curl is not installed. Installing..."
            sudo apt-get update
            sudo apt-get install -y curl
        fi

        # Create install directory if not exists
        sudo mkdir -p /opt/Cursor

        # Download Cursor AppImage
        echo "move Cursor AppImage to /opt/ folder..."
        sudo mv $CURSOR_URL $APPIMAGE_PATH
        sudo chmod +x $APPIMAGE_PATH

        # Download Cursor icon
        echo "Downloading Cursor icon..."
        sudo curl -L $ICON_URL -o $ICON_PATH

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
    else
        echo "ℹ️ Cursor AI IDE is already installed."
    fi
}

installCursor
