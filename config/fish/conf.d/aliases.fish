# conf.d/aliases.fish — all aliases

# ── eza (modern ls) ──────────────────────────────────────────────────────────
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

# ── bat (modern cat) ─────────────────────────────────────────────────────────
if command -sq bat
    alias cat='bat --paging=never'
    alias catp='bat'
end

# ── ripgrep ──────────────────────────────────────────────────────────────────
if command -sq rg
    alias rg='rg --smart-case'
end

# ── core utilities ───────────────────────────────────────────────────────────
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

# ── process / hardware ───────────────────────────────────────────────────────
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias hw='hwinfo --short'

# ── Arch Linux ───────────────────────────────────────────────────────────────
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias archwiki="python -m http.server 8000 --directory /usr/share/doc/arch-wiki/html"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# ── archives ─────────────────────────────────────────────────────────────────
alias tarnow='tar -acf'
alias untar='tar -zxvf'

# ── git ──────────────────────────────────────────────────────────────────────
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

# ── navigation & shortcuts ───────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias q='exit'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias v='$EDITOR'
alias vim='nvim'

# ── config file quick-edit ───────────────────────────────────────────────────
alias kconf='$EDITOR ~/.config/kitty/kitty.conf'
alias fconf='$EDITOR ~/.config/fish/config.fish'
