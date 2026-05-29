# functions/mkcd.fish — mkdir + cd in one step
function mkcd --description "Create directory and cd into it"
    mkdir -p $argv[1] && cd $argv[1]
end
