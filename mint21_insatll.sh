#!/bin/bash

sudo apt update

sudo apt install -y tmux luarocks python3-pip python3-dev ulauncher zsh git vim autojump fzf exa ripgrep batcat zoxide qbittorrent qnapi vlc gimp flameshot flatpak fd-find btop sqlitebrowser rhythmbox build-essential ttf-mscorefonts-installer fonts-noto fonts-noto-color-emoji font-manager cmake ninja-build steam ca-certificates gnupg lsb-release caffeine

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install Discord
curl "https://dl.discordapp.net/apps/linux/0.0.24/discord-0.0.24.deb" -o discord.deb && sudo apt install ./discord.deb && sudo rm -rf discord.deb

# Install Slack
curl "https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb" -o slack.deb && sudo apt install ./slack.deb && sudo rm -rf slack.deb

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Install Brave-browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install google-chrome
curl "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o google-chrome.deb && sudo apt install ./google-chrome.deb && sudo rm -rf google-chrome.deb

# Install neovim
curl "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb" -o neovim.deb && sudo apt install ./neovim.deb && sudo rm -rf neovim.deb

# Install Insomnia
curl "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website" -o insomnia.deb && sudo apt install ./insomnia.deb && sudo rm -rf insomnia.deb

# Prepare Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install browsers
sudo apt update && sudo apt install -y spotify-client brave-browser google-chrome-beta google-chrome-unstable chromium

# Install yarn
sudo apt update && sudo apt install -y --no-install-recommends yarn

# Install Docker
sudo apt docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Install OBS
flatpak install -y flathub com.obsproject.Studio
