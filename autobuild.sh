#!/usr/bin/bash

# Check for the Distro Type & Install necessary packages

PACKAGE_MANAGERS=("pkg" "apt" "yum" "dnf" "pacman" "zypper")
PACKAGES=("zip")

# Define a function to check if a package is installed
check_package() {
  if command -v "$1" >/dev/null; then
    return 0
  else
    return 1
  fi
}

# Loop through the packages and check if they are installed
for PKG in "${PACKAGES[@]}"; do
  check_package "$PKG"
  # If not installed, add it to a list of packages to install
  if [ $? -ne 0 ]; then
    TO_INSTALL+=("$PKG")
  fi
done

# If there are no packages to install then just print all packages are already installed
if [ ${#TO_INSTALL[@]} -eq 0 ]; then
  echo -e "\033[38;5;2mAll required packages are already installed.\033[0m"
  echo -e "\033[38;5;2mStarting Lawnchair Magisk Builder...\033[0m"
fi

# Loop through the package managers and find the one that is available
for PM in "${PACKAGE_MANAGERS[@]}"; do
  if command -v "$PM" >/dev/null; then
    # Use the appropriate command to install the packages
    case "$PM" in
    "pkg") pkg install "${TO_INSTALL[@]}" ;;
    "apt") sudo apt-get install "${TO_INSTALL[@]}" ;;
    "yum") sudo yum install "${TO_INSTALL[@]}" ;;
    "dnf") sudo dnf install "${TO_INSTALL[@]}" ;;
    "pacman") sudo pacman -S --needed "${TO_INSTALL[@]}" ;;
    "zypper") sudo zypper install "${TO_INSTALL[@]}" ;;
    esac
    break
  fi
done

# If the distribution is Fedora, use dnf to install the packages and reinstall figlet
if [ -f /etc/fedora-release ]; then
  sudo dnf install "${TO_INSTALL[@]}"
fi

# Display "Lawnchair Magisk Builder" in color
echo -e "\033[38;5;208mLawnchair Magisk Builder\033[0m"

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
