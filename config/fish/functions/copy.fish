# functions/copy.fish — cp with automatic -r for directories
function copy --description "cp wrapper: auto-recursive for directories"
    if test (count $argv) -eq 2; and test -d $argv[1]
        command cp -r $argv[1] $argv[2]
    else
        command cp $argv
    end
end
