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

LM Studio (`$HOME/.lmstudio/bin`) и Doom Emacs
(`${XDG_CONFIG_HOME:-$HOME/.config}/emacs/bin`) добавляются в `PATH` только при
наличии соответствующих каталогов. NVM подключается при наличии его файлов
в `$HOME/.nvm`.

Команда `cat` в Zsh использует `bat`, если он доступен, иначе — `batcat`
(имя исполняемого файла в Debian/Ubuntu). Если нет обеих команд, alias `cat`
удаляется и используется обычный `cat`. Выбор выполняется после настройки PATH
и NVM, перед подключением `~/.zshrc.local`.

### Тема Oh My Zsh

В `.zshrc` выбрана встроенная тема `alanpeabody`. Собственная тема `guts`
доступна как необязательная альтернатива. Для ее использования после установки
Oh My Zsh создайте ссылку на тему, затем задайте `ZSH_THEME="guts"` в `.zshrc`
перед загрузкой Oh My Zsh. Команды выполняются из корня репозитория:

```bash
theme_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
mkdir -p "$theme_dir"
if [ -e "$theme_dir/guts.zsh-theme" ] || [ -L "$theme_dir/guts.zsh-theme" ]; then
    printf 'Проверьте существующий путь: %s\nОн должен указывать на zsh/oh-my-zsh/guts.zsh-theme этого репозитория.\n' "$theme_dir/guts.zsh-theme"
else
    ln -s "$PWD/zsh/oh-my-zsh/guts.zsh-theme" "$theme_dir/guts.zsh-theme"
fi
```

Если по этому пути находится другая версия темы, сохраните ее перед заменой
на ссылку. При нестандартном `ZSH_CUSTOM` используйте одно и то же значение
при создании ссылки и при запуске Zsh. Без ссылки Oh My Zsh не найдет тему `guts`.
Автоматическое создание ссылки через Dotbot предусмотрено этапом 3.

### Локальные настройки машины

Для индивидуальных переменных, aliases и дополнений к `PATH` создайте
`~/.zshrc.local`. Он подключается в конце `.zshrc`, после общих настроек и NVM,
только если это файл, доступный для чтения. Например:

```zsh
export EDITOR="vim"
export VISUAL="vim"
export GIT_EDITOR="vim"
alias work='cd ~/projects'
```

Этот файл хранится на конкретной машине и не развертывается из репозитория.

## Тема Alacritty

`alacritty/alacritty.toml` импортирует `~/.config/alacritty/themes/guts.toml`.
Создайте ссылку на собственную тему из корня репозитория:

```bash
mkdir -p ~/.config/alacritty/themes
if [ -e "$HOME/.config/alacritty/themes/guts.toml" ] || [ -L "$HOME/.config/alacritty/themes/guts.toml" ]; then
    printf 'Проверьте существующий путь: %s\nОн должен указывать на alacritty/guts.toml этого репозитория.\n' "$HOME/.config/alacritty/themes/guts.toml"
else
    ln -s "$PWD/alacritty/guts.toml" "$HOME/.config/alacritty/themes/guts.toml"
fi
```

Если по этому пути находится другая версия темы, сохраните ее перед заменой
на ссылку. Коллекция `alacritty-theme` для `guts` не требуется. Этот путь
соответствует текущему конфигу для macOS/Linux; конфиг Alacritty для Windows
и поддержка нестандартного XDG-пути запланированы следующим пунктом этапа 1.

## Остальные шаги установки

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Необязательно: подключите guts по инструкции «Тема Oh My Zsh» выше.

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
