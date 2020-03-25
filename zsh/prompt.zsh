autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr     "%F{yellow} +%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr   "%F{green} *%f"   # %u
zstyle ':vcs_info:git:*' formats       "%F{green}(%b%u%c%F{green})%f"
zstyle ':vcs_info:git:*' actionformats "%F{green}(%b%u%c%F{green}|%f%F{red}%a%f%F{green})%f"
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
local p_git='${vcs_info_msg_0_}'
local p_mark="%B%(?,%F{green},%F{red})>%f%b"
local p_br=$'\n'
PROMPT="$p_dir $p_git$p_br$p_mark "
