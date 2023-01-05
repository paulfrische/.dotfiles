export PATH="$PATH:$HOME/.local/bin"
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

ZSH_THEME="alanpeabody"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(git zsh-nvm python z)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

function mkcd() {
    mkdir $1
    cd $1
}

bindkey -v
alias v="nvim"
alias p="python3.10"
alias n="nvim ."
alias nrcj="cd ~/.config/nvim/ && nvim init.lua"
alias nkitty="nvim ~/.config/kitty/kitty.conf"
alias ls="exa -lah --icons -rtchanged"
alias nzsh="nvim ~/.zshrc"
alias jbsp="cd ~/.config/bspwm"
alias mountd="doas mount /dev/sdb ~/d"
alias jd="cd ~/d"
alias yay="yay --sudo doas --sudoflags -- --save"
alias docker="doas podman"
alias lg="lazygit"
alias vc="nvim --cmd 'set rtp+=.'"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias config-add='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -u'

zstyle ':completion:*' menu select

colorscript random
# eval "$(starship init zsh)"
