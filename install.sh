#!/bin/bash

echo "Installing needed packages from pacman..."
sudo pacman -S ttf-jetbrains-mono \
  firefox \
  noto-fonts \
  noto-fonts-emoji \
  noto-fonts-extra \
  papirus-icon-theme \
  picom \
  nitrogen \
  redshift \
  flameshot \
  dunst \
  discord \
  blueman \
  rofi \
  kitty \
  exa \
  btop \
  bat \
  alacritty \
  lazygit \
  bluez \
  bluez-utils \
  blueman \
  opendoas \
  lxappearance \
  gnome-keyring \
  nemo \
  git \
  zsh \
  yarn \
  nodejs \
  go \
  rust \
  deno \
  starship \
  base-devel \
  linux-headers \
  nemo-seahorse \
  nemo-share \
  nemo-preview \
  nemo-image-converter\
  nemo-fileroller \
  nemo-pastebin \
  seahorse \
  vlc \
  libreoffice-fresh \
  evince \
  thunderbird \
  rhythmbox \
  gedit \
  docker \
  docker-compose \
  python-pip \
  ranger \
  gtk-chtheme \
  font-manager \
  gthumb \
  nvidia-settings \
  qbittorrent \
  qnapi \
  simplescreenrecorder \
  vim \
  neovim

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
rm -rf yay

echo "Installing yay needed packages..."
yay -S brave-bin \
  brave-beta-bin \
  google-chrome \
  google-chrome-beta \
  slack-desktop \
  insomnia-bin \
  caffeine-ng \
  visual-studio-code-bin \
  nerd-fonts-jetbrains-mono \
  ttf-ms-fonts \
  adobe-base-14-fonts \
  ttf-font-awesome \
  ttf-mac-fonts \

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/qoomon/zsh-lazyload $ZSH_CUSTOM/plugins/zsh-lazyload
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Creating default folders..."
xdg-user-dirs-update

echo "Installing dotfiles..."
git clone https://github.com/leiswatch/dotfiles.git
cp -r dotfiles/.config/alacritty ~/.config
cp -r dotfiles/.config/btop ~/.config
cp -r dotfiles/.config/dunst ~/.config
cp -r dotfiles/.config/i3 ~/.config
cp -r dotfiles/.config/kitty ~/.config
cp -r dotfiles/.config/lazygit ~/.config
cp -r dotfiles/.config/nvim ~/.config
cp -r dotfiles/.config/picom ~/.config
cp -r dotfiles/.config/polybar ~/.config
cp -r dotfiles/.config/ranger ~/.config
cp -r dotfiles/.config/redshift ~/.config
cp -r dofiles/.config/rofi ~/.config
cp dotfiles/.config/starship.toml ~/.config
cp dotfiles/.zshrc ~/.zshrc
cp dotfiles/.profile ~/.profile
cp dotfiles/.tmux.conf ~/.tmux.conf

echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
