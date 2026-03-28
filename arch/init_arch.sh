#!/bin/bash

# yay
# sudo pacman -Sy --needed less git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# git
git config --global user.name "gheron772"
git config --global user.email "gheron772@gmail.com"
git config --global core.editor "nvim"

# DE
yay --noconfirm -Syu nautilus nautilus-open-any-terminal loupe gnome-calculator
xdg-mime default org.gnome.Loupe.desktop image/jpeg image/png image/gif image/webp
xdg-settings set default-web-browser firefox.desktop
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal ghostty

yay --noconfirm -S hyprpolkitagent hyprlock hyprpaper hyprshot awww-bin waybar wl-copy rofi swayosd wlogout
rm -rf ~/.config/hypr && ln -s ~/dotfiles/arch/hypr/ ~/.config/

# korean
yay --noconfirm -S kime-git ttf-kopub ttf-jetbrains-mono-nerd ttf-d2coding

# dev
yay --noconfirm -S ghostty nvim ripgrep jq net-tools wl-clipboard fastfetch sysstat

# util
yay --noconfirm -S readest ytmdesktop-bin firefox google-chrome glances

# swayosd
sudo systemctl enable --now swayosd-libinput-backend

# waybar
ln -sf ~/dotfiles/arch/waybar ~/.config/
sudo rm -f /etc/xdg/autostart/nm-applet.desktop

# zsh
yay --noconfirm -S zsh-autosuggestions zsh-syntax-highlighting oh-my-zsh-git
chsh -s $(which zsh)

sudo ln -s /usr/share/zsh/plugins/zsh-autosuggestions/ /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting/ /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp -n /usr/share/oh-my-zsh/zshrc ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# kime
mkdir -p ~/.config/kime
ln -s ~/dotfiles/arch/kime/config.yaml ~/.config/kime/config.yaml

# nvim
ln -s ~/dotfiles/nvim ~/.config/

# steam
yay -Sy steam

# rofi theme
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi && ./setup.sh && cd .. && rm -rf ./rofi
