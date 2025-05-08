#!/bin/bash

installCursor() {
    if ! [ -f /opt/Cursor/cursor.appimage ]; then
        echo "Installing Cursor AI IDE..."

        # URLs for Cursor AppImage and Icon
        CURSOR_URL="https://downloader.cursor.sh/linux/appImage/x64"
        ICON_URL="https://raw.githubusercontent.com/yourusername/repo/main/images/cursor-icon.png"

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
        echo "Downloading Cursor AppImage..."
        sudo curl -L $CURSOR_URL -o $APPIMAGE_PATH
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
