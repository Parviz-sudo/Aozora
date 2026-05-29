# conf.d/env.fish — environment variables & PATH
# Fish sources every file in conf.d/ automatically.

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
