set -o vi
bind -s "set completion-ignore-case on"
eval "$(zoxide init --cmd cd bash)"

set-wal () {
    wal -e -n -i "$@"
    
    WALLPAPER="$(< "${HOME}/.cache/wal/wal")"
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $WALLPAPER
    hyprctl hyprpaper wallpaper DP-1,$WALLPAPER
}
