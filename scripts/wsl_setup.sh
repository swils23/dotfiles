#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Update and upgrade packages
echo "Updating and upgrading packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y gcc make git curl ansible build-essential zsh

# Install Homebrew and add to PATH
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Python
echo "Installing Python..."
brew install python
source ~/.zshrc
pip3 install --upgrade pip

# Clone dotfiles and install using Ansible
echo "Cloning dotfiles and installing using Ansible..."
git clone https://github.com/swils23/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install

# Remove dotfiles directory
echo "Removing dotfiles directory..."
cd ~
rm -rf ~/.dotfiles

# Set zsh as default shell
echo "Setting zsh as default shell..."
echo "/usr/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/bin/zsh

# Switch to zsh
echo "Switching to zsh..."
exec zsh
