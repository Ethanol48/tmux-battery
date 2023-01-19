CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

barrera=""
TC="#ffb86c"

print_figure() {

    percentage=$($CURRENT_DIR/battery_percentage.sh)            # check good
    color=$(./color_code)                                       # check good
    font=$(./color_font)                                        # check good
    battery_icon_plus_status=$(./battery_icon_plus_status.sh)   # check good 

    # this four variables are fine they checkout
    
    #{battery_icon_plus_status}

    printf "#[fg=$color]$barrera#[fg=$font,bg=$color,bold]$percentage% #[fg=$font,bg=$color,nobold]$battery_icon_plus_status#[fg=$TC,bg=$BG_BATTERY] "


}

#

main (){
    print_figure
}

main
