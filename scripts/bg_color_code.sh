#!/usr/bin/env bash

source "../scripts/helpers.sh"

# Custom Ethanol
color_font=#132A40

#0D1D2B
#132A40

#E8E8E8
#FFFFFF
#F7F7F7

#85CC91
#00CC22
#00AE22
#2BAD45
#3AAD78

color_full_charge=#3AAD78
color_high_charge=#2BAD45 
color_high_medium_charge=#8fe639
color_medium_charge=#ffd500  
color_low_charge=#ff5500
color_very_low_charge=#ff2A00
color_charging=#00CC22

borrowed_print_battery_status_bg() {
    # Call `battery_percentage.sh`.
    percentage=$(../scripts/battery_percentage.sh | sed -e 's/%//')
    status=$(battery_status | awk '{print $1;}')
    if [ $status == 'charging' ]; then
	    echo $color_charging
    else

        if [ $percentage -eq 100 ]; then
            echo $color_full_charge

        elif [ $percentage -le 99 -a $percentage -ge 76 ];then
            echo $color_high_charge

        elif [ $percentage -le 75 -a $percentage -ge 51 ];then
            echo $color_high_medium_charge

        elif [ $percentage -le 50 -a $percentage -ge 35 ];then
            echo $color_medium_charge

        elif [ $percentage -le 35 -a $percentage -ge 16 ];then
            echo $color_low_charge

        elif [ $percentage -le 16 -a ];then
            echo $color_very_low_charge

        fi
    fi 
    
}

main(){
    echo $(borrowed_print_battery_status_bg)
}

main


