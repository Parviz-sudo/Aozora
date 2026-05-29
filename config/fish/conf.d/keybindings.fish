# conf.d/keybindings.fish — key bindings (fzf history, file picker, ! expansion)

# ── ! → previous command argument ────────────────────────────────────────────
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

# ── fzf integrations ─────────────────────────────────────────────────────────
if command -sq fzf
    # Ctrl+R — fuzzy history search
    function fzf_history
        set cmd (builtin history --show-time='[%F %T] ' \
            | fzf --tac --no-sort --height=40% --border --prompt="History ❯ " \
            | string replace -r '^\[.*?\] ' '')
        if test -n "$cmd"
            commandline $cmd
        end
    end
    bind \cr fzf_history

    # Ctrl+F — fuzzy file picker
    function fzf_file
        set file (fzf --height=40% --border --prompt="File ❯ ")
        if test -n "$file"
            commandline -i $file
        end
    end
    bind \cf fzf_file
end
