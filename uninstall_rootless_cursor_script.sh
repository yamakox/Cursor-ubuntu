#!/bin/bash

uninstallCursor() {
    # Paths for installation
    APPIMAGE_PATH="$HOME/.local/bin/Cursor.AppImage"
    ICON_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/icons/cursor-icon.png"
    DESKTOP_ENTRY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/applications/Cursor.desktop"

    # Check if Cursor is installed
    if [ ! -f "$APPIMAGE_PATH" ]; then
        echo "Cursor may not be installed."
        exit 1
    fi

    read -p "Do you want to uninstall Cursor? [y/N]: " confirm
    if [[ ! "$confirm" =~ ^[yY]$ ]]; then
        echo "Uninstall canceled."
        exit 0
    fi

    # Remove Cursor AppImage
    echo "Removing Cursor AppImage..."
    rm -f $APPIMAGE_PATH

    # Remove Cursor icon
    echo "Removing Cursor icon..."
    rm -f $ICON_PATH

    # Remove Cursor .desktop entry
    echo "Removing Cursor .desktop entry..."
    rm -f $DESKTOP_ENTRY_PATH

    echo "✅ Cursor AI IDE has been uninstalled successfully."
    echo "If you added cursor command, please remove the following line from your .bashrc file:"
    echo
    echo "alias cursor='\$HOME/.local/bin/Cursor.AppImage --no-sandbox'"
    echo
}

uninstallCursor
