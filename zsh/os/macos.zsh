# macOS PATH settings (Apple Silicon).
if [[ -x /opt/homebrew/bin/brew ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
export PATH="/usr/local/bin:$PATH"

if command -v brew >/dev/null 2>&1; then
    if _dotfiles_coreutils_prefix=$(brew --prefix coreutils 2>/dev/null) &&
        [[ -n "$_dotfiles_coreutils_prefix" && -d "$_dotfiles_coreutils_prefix/libexec/gnubin" ]]; then
        export PATH="$_dotfiles_coreutils_prefix/libexec/gnubin:$PATH"
    fi
    unset _dotfiles_coreutils_prefix
fi
