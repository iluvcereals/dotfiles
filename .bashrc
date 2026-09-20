#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Reset and color definitions for Rose Pine
RESET='\[\033[0m\]'
TEXT='\[\033[38;5;252m\]'         # Light grayish white (#e0def4)
SUBTLE='\[\033[38;5;243m\]'       # Muted lavender-gray (#6e6a86)
HIGHLIGHT='\[\033[38;5;177m\]'    # Soft lavender (#c4a7e7)
PRIMARY='\[\033[38;5;210m\]'      # Rose pink (#eb6f92)
LOVE='\[\033[38;5;176m\]'         # Rose pink alternative (#ea9a97)
GOLD='\[\033[38;5;214m\]'         # Gold (#f6c177)
PINE='\[\033[38;5;73m\]'          # Deep green-blue (#3e8fb0)
FOAM='\[\033[38;5;110m\]'         # Muted pastel blue (#89b4fa / soft slate blue)
IRIS='\[\033[38;2;203;166;247m\]' # Rich mauve purple (#cba6f7)

git_branch() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        # git:( ) = Warm Pastel Yellow (#f9e2af)
        # branch  = Dark Pastel Red (#e06c75)
        printf ' \001\033[38;2;249;226;175m\002git:(\001\033[38;2;224;108;117m\002%s\001\033[38;2;249;226;175m\002)\001\033[0m\002' "$branch"
    fi
}

# PS1="${HIGHLIGHT}\w${RESET}\$(git_branch) ${PRIMARY}──●◎●── ${RESET}"
PS1="${IRIS}\W${RESET}\$(git_branch) "

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Alias to source bashrc
alias sbash='source ~/.bashrc'

# Alias for fzf to open with vim when selected
# alias fz='fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'

fzd() {
    local dir
    dir=$(fd --type d \
        --exclude node_modules \
        --exclude .git \
        --exclude angular \
        --exclude 'dsa/*' \
        --base-directory ~/Code/Learning | fzf)
    if [ -n "$dir" ]; then
        cd "$HOME/Code/Learning/$dir" && nvim
    fi
}

# Alias to open neovim with vim
alias vim='nvim'

# Alias to open bashrc with vim
alias bashconf='vim ~/.bashrc'

# Alias to open neofetch config with vim
alias nfconf='cd $HOME/.config/neofetch/ && vim config.conf'

# Alias to change to tmux config directory and open the tmux config
alias tmuxconf='vim $HOME/.tmux.conf'

# Alias to change to vim config directory and open vim config directory
alias vimconf='cd $HOME/.config/nvim && vim'

# Alias to change to i3 config directory and open i3 config
alias i3conf='cd $HOME/.config/i3 && vim config'

# Alias to change to i3 config directory and open i3block config
alias i3bconf='cd $HOME/.config/i3 && vim i3blocks.conf'

# Alias to change to kitty config directory and open kitty config file
alias kittyconf='cd $HOME/.config/kitty && vim kitty.conf'

# Alias to change to picom config directory and open picom config file
alias picomconf='cd $HOME/.config/picom && vim picom.conf'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

bind -x '"\C-f": tmux-sessionizer'

export PATH="$HOME/go/bin:$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

. "$HOME/.cargo/env"

# Added by Antigravity CLI installer
export PATH="/home/ian/.local/bin:$PATH"

export PATH=$PATH:/home/ian/.spicetify

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
