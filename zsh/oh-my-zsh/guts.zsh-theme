# --- Palette (guts.nvim) ---
local g_bg='#101113'
local g_bg_alt='#161719'
local g_fg='#9f9e99'
local g_fg_subtle='#787487'
local g_fg_muted='#554A62'
local g_accent='#83799C'
local g_warm='#ac7f7b'
local g_pink='#8a4f53'
local g_blue='#697a9a'
local g_green='#7a837c'
local g_red='#6f2e2a'
local g_highlight='#a7d8b0'

local user="%F{$g_accent}%n@%m%{$reset_color%}"
local pwd="%F{$g_blue}%~%{$reset_color%}"
local return_code="%(?..%F{$g_red}%? ↵%{$reset_color%})"
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{$g_green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%F{$g_green} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{$g_blue} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%F{$g_red} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{$g_accent} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{$g_warm} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{$g_fg_subtle} ✭"

ZSH_THEME_RUBY_PROMPT_PREFIX="%F{$g_green}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT="${user} ${pwd}$ "
RPROMPT="${return_code} ${git_branch} \$(ruby_prompt_info)"

