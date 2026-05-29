# conf.d/zoxide.fish — zoxide (smart cd) setup

if command -sq zoxide
    zoxide init fish | source
    alias cd='z'
    alias cdi='zi'   # interactive with fzf
end
