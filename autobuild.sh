#!/usr/bin/bash

# Check for the Distro Type

# Check if pkg package manager is available
which "pkg"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using pkg
    pkg install zip figlet
fi

# Check if apt package manager is available
which "apt"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using apt-get
    sudo apt-get install zip figlet
fi

# Check if yum package manager is available
which "yum"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using yum
    sudo yum install zip figlet
fi

# Check if dnf package manager is available
which "dnf"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using dnf
    sudo dnf install zip figlet
fi

# Check if pacman package manager is available
which "pacman"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using pacman
    sudo pacman -S zip figlet
fi

# Check if zypper package manager is available
which "zypper"
RESULT=$?
if [ $RESULT -eq 0 ]; then
    # Install zip and figlet package using zypper
    sudo zypper install zip figlet
fi

# Check if the current Linux distribution is Fedora
if [ -f /etc/fedora-release ]; then
    # Install zip and figlet package using dnf
    sudo dnf install zip figlet
fi

# Display "Lawnchair Magisk" in bigger fonts
figlet "Lawnchair Magisk"

# Check if zip is installed
if ! command -v zip >/dev/null; then
    echo "Error: zip is not installed. Please install it manually and try again."
    exit 1
fi

# Read version from module.prop file
version=$(grep "version=" module.prop | cut -d "=" -f 2)

# Delete already exists module zip
rm -rf Lawnchair\ Magisk*

# Check if the current directory has system folder and setup.sh to verify that current directory is valid
if [ ! -d "system" ] || [ ! -f "setup.sh" ]; then
    echo "Error: Current directory is not valid. Make sure that you are in the right directory and try again."
    exit 1
fi

# Create zip file
echo ">> Creating zip file"
echo ""                                                                                           # make the output look easier to read
zip -r -q "Lawnchair Magisk $version.zip" . -x .git/\* autobuild.sh banner.png logo.png README.md # Ignore specified files and folders because they are not needed for the module
echo ""                                                                                           # make the output look easier to read
echo ">> Done! You can find the module zip file in the current directory - '$(pwd)/Lawnchair Magisk $version.zip'"
