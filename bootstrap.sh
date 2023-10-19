#!/bin/bash

#Variables
GIT_USER_NAME="Ricardo Silva"
GIT_USER_EMAIL="github@ricardosilva.pt"
HOSTNAME="Loki"


# Sorce env variables
source dotfiles/.env.sh

################################################################################
# Homebrew installation and configuration
################################################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew packages
homebrew_apps=(
	7zip asdf awscli bat lsd fzf gnupg zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions python@3.9 python@2.7
)
brew install ${homebrew_apps[*]}
rm -f ~/.zcompdump; compinit

brew tap homebrew/cask-fonts
homebrew_casks=(
	azure-data-studio google-chrome obs spotify visual-studio-code font-hack-nerd-font
)
brew install --cask ${homebrew_casks[*]}

################################################################################
# Install/Configure zsh and/or oh-my-zsh
################################################################################

# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- -y
chsh -s $(which zsh)

cp dotfiles/.zshrc ~/.zshrc
cp dotfiles/.zprofile ~/.zprofile
cp dotfiles/.env.sh ~/.env.sh
cp dotfiles/.p10k.zsh ~/.p10k.zsh
source ~/.zshrc

################################################################################
# Git configuration
################################################################################
cp dotfiles/git_config $HOME/.config/git/config
sed -i "s/GIT_USER_NAME/$GIT_USER_NAME/g" $HOME/.config/git/config
sed -i "s/GIT_USER_EMAIL/$GIT_USER_EMAIL/g" $HOME/.config/git/config

################################################################################
# fzf configuration
################################################################################
$(brew --prefix)/opt/fzf/install --no-fish --all

################################################################################
# vscode settings
################################################################################
cp dotfiles/vscode.settings.json ~/Library/Application Support/Code - Insiders/User/settings.json

################################################################################
# mouse settings
################################################################################
cp dotfiles/mac-mouse-fix.config ~/Library/Application Support/com.nuebling.mac-mouse-fix/config.plist

################################################################################
# Node.js installation and configuration
################################################################################

# Install Node.js
asdf plugin add nodejs
asdf install nodejs latest:18
asdf global nodejs latest:18

################################################################################
# Install pip and setuptools
################################################################################

pip install --upgrade setuptools
pip install --upgrade pip

################################################################################
# MacOS Configurations
################################################################################
. macos.sh