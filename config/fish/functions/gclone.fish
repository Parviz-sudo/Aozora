# functions/gclone.fish — git clone + cd into the repo
function gclone --description "Clone a repo and cd into it"
    git clone $argv[1] && cd (basename $argv[1] .git)
end
