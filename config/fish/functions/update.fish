# functions/update.fish — full system update (pacman + AUR)
function update --description "Update pacman and AUR packages"
    echo "📦 Updating pacman..."
    sudo pacman -Syu
    if command -sq paru
        echo "📦 Updating AUR (paru)..."
        paru -Sua --noconfirm
    end
    echo "✅ All done!"
end
