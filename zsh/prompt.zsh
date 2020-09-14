# Current Directory
case ${OSTYPE} in
  darwin*)
    # Mac OS
    local p_dir="%F{blue}[%~]%f"
    ;;
  *)
    # Other OS
    local p_dir="%F{blue}[%m:%~]%f"
    ;;
esac

# Git
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr     "%F{yellow}+%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr   "%F{green}*%f"   # %u
zstyle ':vcs_info:git:*' formats       "%F{green}%b%u%c"
zstyle ':vcs_info:git:*' actionformats "%F{green}%b%u%c%F{green}|%f%F{red}%a%f"
local p_git='${vcs_info_msg_0_}'

# pyenv
local p_pyenv='%F{green}py:$(pyenv version-name)%f'

# General
local p_br=$'\n'
local p_mark="%B%(?,%F{green},%F{red})>%f%b"
local p_info="%F{green}(%f$p_git$p_pyenv%F{green})%f"
PROMPT="$p_dir $p_info $p_br$p_mark "
