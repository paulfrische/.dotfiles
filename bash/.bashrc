#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin:$PATH"
export MANPAGER="nvim +Man!"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function mkcd() {
    mkdir $1
    cd $1
}

function today() {
    date '+%a-%d.%m.%Y'
}

set -o vi

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

alias h="compgen -c | fzf | xargs man"

alias v="nvim"
alias p="python"
alias nrcj="z ~/.config/nvim/ && nvim init.lua"
alias ls="exa -lah --icons"
alias jd="z ~/d"
alias yay="yay --sudo doas --sudoflags -- --save"
alias c="cargo"
alias cd="z"

alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

alias vtd="nvim $(today).md"
alias ctd="pandoc -o $(today).pdf $(today).md"

alias odin="/home/paul/d/repos/Odin/odin"

eval "$(zoxide init bash)"
eval "$(starship init bash)"
