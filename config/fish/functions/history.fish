# functions/history.fish — wrap builtin history to always show timestamps
function history --description "Show command history with timestamps"
    builtin history --show-time='%F %T ' $argv
end
