# functions/ginit.fish — git init with first commit
function ginit --description "Init a git repo and make the first commit"
    git init
    git add .
    git commit -m "🎉 Initial commit"
end
