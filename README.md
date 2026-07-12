# dotfiles

```bash
# Alacritty themes
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

cp alacritty/guts.toml ~/.config/alacritty/themes/themes/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# optional
cp zsh/oh-my-zsh/guts.zsh-theme ~/.oh-my-zsh/custom/themes/

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

# Packer for nvim3
mkdir -p ~/.local/share/nvim/site/pack/packer/start/

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# for macOS
brew install skhd yabai
cp skhd ~/.config/skhd
cp yabai ~/.config/yabai

# For WSL download win32yank.exe and copy it to C/Windows/System32
# In nvim/init.lua uncomment block for win32yank.exe 

```

TODO:
- add install utils: nvim tmux bat tree
- add install zsh
- I will do it in script may be
- add confs for skhd and yabai 
