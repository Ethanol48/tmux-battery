CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"
source "$CURRENT_DIR"

barrera="█"
barrera_extendida='█ '

TC="#ffb86c"

barrera=$(get_tmux_option "@batt_barrera" "$barrera")
barrera_extendida=$(get_tmux_option "@batt_barrera_extendida" "$barrera_extendida")

print_figure() {

    percentage=$($CURRENT_DIR/battery_percentage.sh)            # check good
    color=$($CURRENT_DIR/color_code)                                       # check good
    font=$($CURRENT_DIR/color_font)                                       # check good
    battery_icon_plus_status=$($CURRENT_DIR/battery_icon_plus_status.sh)   # check good 

    # this four variables are fine they checkout
    
    #{battery_icon_plus_status}

    printf "#[fg=$color]▐#[fg=$font,bg=$color,bold] $percentage% #[fg=$font,bg=$color,nobold]$battery_icon_plus_status#[fg=$TC,bg=$BG_BATTERY] "


}

#

main (){
    print_figure
}

main
