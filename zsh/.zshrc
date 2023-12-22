PROMPT="%F{green}%~%f %F{red}λ%f "

export PATH="$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK_THEME="rose-pine-gtk"

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
alias p="python"
alias nrcj="z ~/.config/nvim/ && nvim init.lua"
alias ls="exa -lah --icons"
alias jd="z ~/d"
alias yay="yay --sudo doas --sudoflags -- --save"
alias c="cargo"
alias cd="z"

alias gst="git status"
alias gc="git commit"
alias gp="git push"

eval "$(zoxide init zsh)"

colorscript -r
