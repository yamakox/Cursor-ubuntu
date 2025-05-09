# Cursor-ubuntu
This is a guideline for installing Cursor on Ubuntu.

## Prerequisites
- Ubuntu 22.04 operating system
- Internet connection
- sudo privileges

## Installation Steps

1. **Download Cursor AppImage**
   - Visit [Cursor's official download page](https://www.cursor.com/downloads)
   - Download the Linux AppImage file

2. **Download Installation Script**
   - Clone this repository or download the `install_cursor_script.sh` file
   - Make the script executable:
     ```bash
     chmod +x install_cursor_script.sh
     ```

3. **Run the Installation Script**
   - Execute the script:
     ```bash
     ./install_cursor_script.sh
     ```
   - When prompted:
     - Enter the path to your downloaded Cursor AppImage file (e.g. `Download/Cursor-0.49.6-x86_64.AppImage`)
     - Enter the icon filename (e.g., `cursor-icon.png` or `cursor-black-icon.png`)

4. **Launch Cursor**
   - After installation, you can find Cursor in your application menu
   - Alternatively, you can launch it from the terminal:
     ```bash
     /opt/Cursor/cursor.appimage --no-sandbox
     ```

## Installation Details
The script will:
- Install Cursor in `/opt/Cursor/`
- Create a desktop entry for easy access
- Set up the application icon
- Make the AppImage executable

## Troubleshooting
If you encounter any issues:
1. Ensure you have sudo privileges
2. Check if curl is installed (the script will install it if missing)
3. Verify that the AppImage file is downloaded correctly
4. Make sure the icon file exists in the repository

## Uninstallation
To uninstall Cursor:
1. Remove the application files:
   ```bash
   sudo rm -rf /opt/Cursor
   ```
2. Remove the desktop entry:
   ```bash
   sudo rm /usr/share/applications/cursor.desktop
   ```
