# ==============================================================================
# ENV
# ==============================================================================
export LANG=ja_JP.UTF-8
export EDITOR="emacs"
# for crontab
export VISUAL="emacs"

# ==============================================================================
# alias
# ==============================================================================
alias cp='cp -i'
alias mkdir='mkdir -p'
alias mv='mv -i'

# ==============================================================================
# history
# ==============================================================================
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=100
export SAVEHIST=1000000

setopt EXTENDED_HISTORY
setopt hist_expand
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store

function history-all { history -E 1 }

# ==============================================================================
# prompt
# ==============================================================================
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

function _update_vcs_info_msg() {
    LANG=ja_JP.UTF-8 vcs_info
    PROMPT="%F{magenta}%n%f @ %F{yellow}%m%f | %F{green}%~%f ${vcs_info_msg_0_}
%% "
}

add-zsh-hook precmd _update_vcs_info_msg

# ==============================================================================
# color
# ==============================================================================
## configure LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad

## enable colors
autoload -Uz colors
colors
