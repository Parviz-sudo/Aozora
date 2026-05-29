# functions/backup.fish — timestamped file/dir backup
function backup --description "Copy a file/dir with a timestamped .bak suffix"
    set timestamp (date +%Y%m%d_%H%M%S)
    cp -r $argv[1] "$argv[1].bak.$timestamp"
    echo "✅ Backup: $argv[1].bak.$timestamp"
end
