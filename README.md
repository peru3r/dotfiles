# dotfiles


# Alacritty themes
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# zsh settings
echo "source \$HOME/.config/zsh/env.zsh" >> ~/.zshrc
echo "source \$HOME/.config/zsh/aliases.zsh" >> ~/.zshrc


# Install nodejs and pyright LSP server for Python
# https://nodejs.org/en/download/package-manager
# choose linux and nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
nvm install 23
node -v
npm -v

npm i -g npm
npm i -g pyright


# Packer for nvim
mkdir -p ~/.local/share/nvim/site/pack/packer/start/

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim


TODO:
- добавить .zshrc
- добавить в README установку zshrc 
- добавить сборку fzf-telescope
- добавить установку zsh
- сделать из этого скрипт для развертывания рабочего места
- Добавить установку win32yank.exe для WSL и не забыть расскоментить блок в 
                                                                nvim/init.lua
