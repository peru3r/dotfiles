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

## Alacritty

Конфиг разделен на пять файлов в `alacritty/`:

| Файл | Содержимое |
| --- | --- |
| `common.toml` | Общие настройки окна, шрифта, TERM/COLORTERM и Alt+стрелок |
| `guts.toml` | Цветовая схема |
| `macos.toml` | `Buttonless`, Alt+Space и локаль `en_US.UTF-8` |
| `linux.toml` | `Full`, наследование локали |
| `windows-wsl.toml` | `Full`, запуск `wsl.exe` с `args = ["~"]` |

Каждый платформенный конфиг импортирует `common.toml` и `guts.toml` относительно
своего расположения. Загрузка импортов проверена на Alacritty 0.15.1 для macOS.
В macOS/Linux используется shell пользователя по умолчанию.
Чтобы запускался Zsh, он должен быть выбран login shell пользователя либо через
окружение `SHELL`. На Windows шрифт нужно установить на Windows-хосте.

### macOS / Linux

Развертывание через Dotbot будет реализовано в этапе 3. Схема трех ссылок в
`${XDG_CONFIG_HOME:-$HOME/.config}/alacritty/`:

```text
alacritty.toml -> <репозиторий>/alacritty/macos.toml   # linux.toml для Linux
common.toml   -> <репозиторий>/alacritty/common.toml
guts.toml     -> <репозиторий>/alacritty/guts.toml
```

Прежний единый `alacritty/alacritty.toml` заменен платформенными файлами: при
обновлении потребуется изменить существующую ссылку на главный конфиг и разместить
рядом обе ссылки на импортируемые файлы. Старый `themes/guts.toml` больше не используется.
До развертывания новый конфиг можно открыть прямо из корня репозитория:

```bash
alacritty --config-file "$PWD/alacritty/macos.toml"  # linux.toml для Linux
```

При нестандартном `XDG_CONFIG_HOME` переменная должна быть доступна процессу
Alacritty, включая запуск из графического окружения. Иначе передайте полный путь
к развернутому `alacritty.toml` через `--config-file`.

### Windows / WSL

Пока выполняется ручное копирование. После сохранения существующих конфигов
скопируйте файлы из репозитория в `%APPDATA%\alacritty`:

```text
windows-wsl.toml -> alacritty.toml
common.toml     -> common.toml
guts.toml       -> guts.toml
```

Все три файла должны находиться рядом. Главный конфиг запускает WSL-дистрибутив
по умолчанию в домашнем каталоге. При обновлении повторите копирование трех файлов.
Автоматизация доставки из WSL будет добавлена позже.

### Проверка shell, шрифта и локали

Текущий шрифт в `common.toml` — **Comic Mono**. Проверяйте его на системе,
где запущен Alacritty: для Windows/WSL это Windows, а не Linux-дистрибутив.
Установка шрифта пока выполняется вручную.

**Shell — macOS/Linux и внутри WSL:**

```bash
printf 'SHELL=%s\n' "$SHELL"
test -n "$SHELL" && test -f "$SHELL" && test -x "$SHELL"
command -v zsh
```

`test` должен завершиться с кодом 0. `$SHELL` показывает shell, переданный через
окружение; если он не задан, Alacritty в macOS/Linux использует login shell.
Проверить login shell можно командами:

```bash
# macOS
dscl . -read "/Users/$(id -un)" UserShell
# Linux / внутри WSL
getent passwd "$(id -un)"  # shell — последнее поле записи
```

Наличие `zsh` само по себе не делает его shell по умолчанию. Если используется
другой shell, `.zshrc` автоматически не загрузится. Смена login shell — отдельное
действие, конфигурация Alacritty ее не выполняет.

**Шрифт:**

- macOS: в Font Book («Шрифты») найдите семейство `Comic Mono` и убедитесь,
  что оно активно. Системный список также доступен через
  `system_profiler SPFontsDataType`.
- Linux: выполните `fc-list : family` и `fc-match 'Comic Mono'`, если эти
  утилиты Fontconfig доступны. В списке должно присутствовать именно семейство
  `Comic Mono`, а `fc-match` должен выбирать его. Успешный код завершения
  `fc-match` недостаточен: при отсутствии шрифта он может вернуть замену.
- Windows: в «Параметры → Персонализация → Шрифты» проверьте наличие семейства
  `Comic Mono`. После установки перезапустите Alacritty.

**Локаль — в shell, запущенном из Alacritty:**

```bash
locale
locale charmap
locale -a
```

Ожидается кодировка UTF-8 без сообщений о недоступной локали. Linux и WSL
наследуют настройки своей системы; выбранная локаль должна присутствовать
в `locale -a`. На macOS конфиг задает `LANG=en_US.UTF-8`; его доступность можно
отдельно проверить командой `LC_ALL=en_US.UTF-8 locale charmap`. Учтите, что
унаследованные `LC_ALL` и `LC_*` имеют приоритет над `LANG`.

**Запуск WSL — в PowerShell на Windows:**

```powershell
Get-Command wsl.exe -ErrorAction Stop
wsl.exe --list --verbose
wsl.exe ~
```

Должен открыться домашний каталог в WSL-дистрибутиве по умолчанию. Проверки shell
и локали выполните уже внутри него. Эти проверки не меняют выбранный shell,
не устанавливают шрифты и не генерируют локали; автоматическая диагностика
запланирована в `doctor.sh`.

### Проверка после развертывания

Проверяйте именно развернутый конфиг. Alacritty может пропустить отсутствующий
импорт, поэтому сначала убедитесь, что доступны все три файла.

macOS/Linux:

```bash
(
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"
for file in alacritty.toml common.toml guts.toml; do
    test -L "$config_dir/$file" && test -f "$config_dir/$file" && test -r "$config_dir/$file" || {
        printf 'Ошибка: нет читаемой ссылки %s\n' "$config_dir/$file"
        exit 1
    }
done
alacritty migrate --dry-run --config-file "$config_dir/alacritty.toml" &&
alacritty -vv --config-file "$config_dir/alacritty.toml"
)
```

При ошибке проверки ссылок запуск прерывается; исправьте развертывание.
Если на macOS команда отсутствует в PATH, используйте
`/Applications/Alacritty.app/Contents/MacOS/alacritty`.

Windows (PowerShell):

```powershell
$configDir = Join-Path $env:APPDATA 'alacritty'
foreach ($file in @('alacritty.toml', 'common.toml', 'guts.toml')) {
    if (-not (Test-Path -LiteralPath (Join-Path $configDir $file) -PathType Leaf)) {
        throw "Отсутствует конфиг: $file"
    }
}
alacritty migrate --dry-run --config-file (Join-Path $configDir 'alacritty.toml')
if ($LASTEXITCODE -ne 0) { throw 'Ошибка проверки конфигурации Alacritty' }
alacritty -vv --config-file (Join-Path $configDir 'alacritty.toml')
```

`migrate --dry-run` разбирает файлы и рекурсивно проверяет импорты без записи
изменений; это не полная проверка параметров приложения. При обычном запуске
с `-vv` проверьте список загруженных конфигов и отсутствие ошибок конфигурации,
а также цвета, Alt+стрелки, оформление окна и запуск ожидаемого shell/WSL.

## yabai (macOS)

`yabai/yabairc` — исполняемый POSIX shell-скрипт. Он не запускает
`sudo yabai --load-sa` и не регистрирует загрузку scripting addition после
перезапуска Dock. Настройка scripting addition отложена; полная работа
существующих правил и сочетаний skhd для Spaces требует отдельной проверки.

Если прежний конфиг уже зарегистрировал обработчик `dock_did_restart`, удаление
строки из файла не удаляет его из работающего процесса. После развертывания
обновленного конфига перезапустите службу yabai. Уже загруженная scripting
addition этими изменениями не выгружается.

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
