# dotfiles

## Подключение общих переменных Zsh

Перед подключением или обновлением `.zshrc` создайте ссылку на каталог `zsh/`.
Выполняйте команды из корня этого репозитория:

```bash
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$config_home"
if [ -e "$config_home/zsh" ] || [ -L "$config_home/zsh" ]; then
    printf 'Проверьте существующий путь: %s\nОн должен указывать на каталог zsh этого репозитория.\n' "$config_home/zsh"
else
    ln -s "$PWD/zsh" "$config_home/zsh"
fi
```

Если по этому пути уже находится другой конфиг, сначала сохраните его и освободите
путь для ссылки. `.zshrc` загружает из него `env.zsh`, задающий пути Oh My Zsh и NVM,
а также переменные редактора. При нестандартном `XDG_CONFIG_HOME` эта переменная
должна быть задана и при запуске Zsh. Автоматическое развертывание ссылки запланировано
в этапе 3 `PLAN.md`.

## Остальные шаги установки

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

# for macOS
brew install skhd yabai
cp skhd ~/.config/skhd
cp yabai ~/.config/yabai

# For WSL download win32yank.exe and copy it to C/Windows/System32

```

TODO:
- add install utils: nvim tmux bat tree
- add install zsh
- I will do it in script may be
