# ============================================================================
#  ___ ___ ___ _  _    ___  ___  _  _ ___ ___ ___
# | __|_ _/ __| || |  / __|/ _ \| \| | __|_ _/ __|
# | _| | |\__ \ __ | | (__| (_) | .` | _| | | (_ |
# |_| |___|___/_||_|  \___|\___/|_|\_|_| |___\___|
# ============================================================================

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    starship init fish | source
end


# ============================================================================
# ENVIRONMENT
# ============================================================================

# Man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Editor
set -x EDITOR nvim
set -x VISUAL nvim

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.spicetify

# ============================================================================
# PLUGINS (done notification)
# ============================================================================

set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# ============================================================================
# ZOXIDE
# ============================================================================

if command -sq zoxide
    zoxide init fish | source
    alias cd='z'
    alias cdi='zi'   # interactive با fzf
end

# ============================================================================
# ALIASES
# ============================================================================

# eza
if command -sq eza
    alias ls='eza -al --color=always --group-directories-first --icons=always'
    alias la='eza -a  --color=always --group-directories-first --icons=always'
    alias ll='eza -l  --color=always --group-directories-first --icons=always'
    alias lt='eza -aT --color=always --group-directories-first --icons=always --level=2'
    alias l.='eza -a  --color=always --group-directories-first --icons=always | grep -e "^\."'
    alias tree='eza --tree --color=always --icons=always'
else
    alias ls='ls --color=auto'
    alias la='ls -A --color=auto'
    alias ll='ls -lh --color=auto'
end

# bat
if command -sq bat
    alias cat='bat --paging=never'
    alias catp='bat'
end

# ripgrep
if command -sq rg
    alias rg='rg --smart-case'
end

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -sh'
alias dus='du -sh * | sort -h'
alias free='free -h'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias wget='wget -c'
alias curl='curl -L'

alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias hw='hwinfo --short'

# Arch
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias archwiki="python -m http.server 8000 --directory /usr/share/doc/arch-wiki/html"

alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias tarnow='tar -acf'
alias untar='tar -zxvf'

# ============================================================================
# ALIASES — git
# ============================================================================

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gst='git stash'
alias gsp='git stash pop'

# ============================================================================
# ALIASES — shortcuts
# ============================================================================

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias q='exit'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias v='$EDITOR'
alias vim='nvim'
# kitty config
alias kconf='$EDITOR ~/.config/kitty/kitty.conf'
alias fconf='$EDITOR ~/.config/fish/config.fish'

# ============================================================================
# FUNCTIONS
# ============================================================================

function update
    echo "📦 Updating pacman..."
    sudo pacman -Syu
    if command -sq paru
        echo "📦 Updating AUR (paru)..."
        paru -Sua --noconfirm
    end
    echo "✅ All done!"
end

# ============================================================================
# FUNCTIONS — فایل و دایرکتوری
# ============================================================================

# mkdir + cd
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# backup
function backup
    set timestamp (date +%Y%m%d_%H%M%S)
    cp -r $argv[1] "$argv[1].bak.$timestamp"
    echo "✅ Backup: $argv[1].bak.$timestamp"
end

# extract
function extract
    if not test -f $argv[1]
        echo "❌ File not found: $argv[1]"
        return 1
    end
    switch $argv[1]
        case '*.tar.bz2'; tar xjf $argv[1]
        case '*.tar.gz';  tar xzf $argv[1]
        case '*.tar.xz';  tar xJf $argv[1]
        case '*.tar.zst'; tar --zstd -xf $argv[1]
        case '*.tar';     tar xf  $argv[1]
        case '*.bz2';     bunzip2 $argv[1]
        case '*.gz';      gunzip  $argv[1]
        case '*.zip';     unzip   $argv[1]
        case '*.rar';     unrar x $argv[1]
        case '*.7z';      7z x    $argv[1]
        case '*.zst';     unzstd  $argv[1]
        case '*'
            echo "❓ Unknown format: $argv[1]"
            return 1
    end
    echo "✅ Extracted: $argv[1]"
end

# copy
function copy
    if test (count $argv) -eq 2; and test -d $argv[1]
        command cp -r $argv[1] $argv[2]
    else
        command cp $argv
    end
end

# ============================================================================
# FUNCTIONS — git
# ============================================================================

# init + fisrt commit
function ginit
    git init
    git add .
    git commit -m "🎉 Initial commit"
end

# clone + cd
function gclone
    git clone $argv[1] && cd (basename $argv[1] .git)
end

# ============================================================================
# FUNCTIONS - network
# ============================================================================

function myip
    curl -s https://ifconfig.me
    echo
end

function speedtest
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
end

# ============================================================================
# FUNCTIONS — history search
# ============================================================================

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

bind ! __history_previous_command_arguments

# ============================================================================
# FUNCTIONS — history
# ============================================================================

function history
    builtin history --show-time='%F %T ' $argv
end

# ============================================================================
# KEY BINDINGS
# ============================================================================

# Ctrl+R
if command -sq fzf
    function fzf_history
        set cmd (builtin history --show-time='[%F %T] ' | fzf --tac --no-sort --height=40% --border --prompt="History ❯ " | string replace -r '^\[.*?\] ' '')
        if test -n "$cmd"
            commandline $cmd
        end
    end
    bind \cr fzf_history

    # Ctrl+F
    function fzf_file
        set file (fzf --height=40% --border --prompt="File ❯ ")
        if test -n "$file"
            commandline -i $file
        end
    end
    bind \cf fzf_file
end
