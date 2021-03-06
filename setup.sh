#!/usr/bin/env bash

#infoln "Changing mbp default names"
#sudo scutil --set LocalHostName "localhost"
#sudo scutil --set ComputerName "mbp"
#

# Install Xcode tools
infoln "Installing Xcode codechain..."
xcode-select --install

# Install all commands, apps, tools, fonts with Homebrew
source "$(curl -fsSL https://raw.githubusercontent.com/mattrighetti/dotfiles/master/macos/brew.sh)"

infoln "Creating npm global directory"
mkdir -p $HOME/.npm-global/lib

infoln "Installing Vue CLI..."
npm install -g @vue/cli

infoln "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

infoln "Downloading zsh plugins..."
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git      $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git          $ZSH_CUSTOM/plugins/zsh-completions

infoln "Setting macOS defaults..."
source "$(curl -fsSL https://raw.githubusercontent.com/gtsilva/dotfiles_mac/main/macos)"


#infoln "Setting up dotfiles"
#packages=(
#    git
#    htop
#    npm
#    vim
#    zsh
#    omz
#)
#

successln "Done!"

read -p "Press [Enter] and enter password to reboot"
sudo reboot
