#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"



icon_charge_tier10_default='󰁹'
icon_charge_tier9_default='󰂂'
icon_charge_tier8_default='󰂂'
icon_charge_tier7_default='󰂁'
icon_charge_tier6_default='󰁿'
icon_charge_tier5_default='󰁾'
icon_charge_tier4_default='󰁽'
icon_charge_tier3_default='󰁼'
icon_charge_tier2_default='󰁻'
icon_charge_tier1_default='󰁺'
icon_charge_tier0_default='󰂎'


# charging icons 
icon_charge_tier10_charging='󰂅'
icon_charge_tier9_charging='󰂋'
icon_charge_tier8_charging='󰂊'
icon_charge_tier7_charging='󰢞'
icon_charge_tier6_charging='󰂉'
icon_charge_tier5_charging='󰢝'
icon_charge_tier4_charging='󰂈'
icon_charge_tier3_charging='󰂇'
icon_charge_tier2_charging='󰂆'
icon_charge_tier1_charging='󰢜'
icon_charge_tier0_charging='󰢟'





# icons are set as script global variables
get_icon_charge_settings() {
	icon_charge_tier10=$(get_tmux_option "@batt_icon_charge_tier10" "$icon_charge_tier10_default")
	icon_charge_tier9=$(get_tmux_option "@batt_icon_charge_tier9" "$icon_charge_tier9_default")
	icon_charge_tier8=$(get_tmux_option "@batt_icon_charge_tier8" "$icon_charge_tier8_default")
	icon_charge_tier7=$(get_tmux_option "@batt_icon_charge_tier7" "$icon_charge_tier7_default")
	icon_charge_tier6=$(get_tmux_option "@batt_icon_charge_tier6" "$icon_charge_tier6_default")
	icon_charge_tier5=$(get_tmux_option "@batt_icon_charge_tier5" "$icon_charge_tier5_default")
	icon_charge_tier4=$(get_tmux_option "@batt_icon_charge_tier4" "$icon_charge_tier4_default")
	icon_charge_tier3=$(get_tmux_option "@batt_icon_charge_tier3" "$icon_charge_tier3_default")
	icon_charge_tier2=$(get_tmux_option "@batt_icon_charge_tier2" "$icon_charge_tier2_default")
	icon_charge_tier1=$(get_tmux_option "@batt_icon_charge_tier1" "$icon_charge_tier1_default")
	icon_charge_tier0=$(get_tmux_option "@batt_icon_charge_tier0" "$icon_charge_tier0_default")

}


print_icon_charge_plus_status() {
	percentage=$($CURRENT_DIR/battery_percentage.sh | sed -e 's/%//')
    status=$(battery_status | awk '{print $1;}')
    if [ $status == 'charging' ]; then
        
        if [ $percentage -ge 100 -o "$percentage" == "" ]; then
		    # if percentage is empty, assume it's a desktop         # maximum
		    printf "$icon_charge_tier10_default"
        
        elif [ $percentage -ge 90 ]; then
		    printf "$icon_charge_tier9_charging"
	
        elif [ $percentage -ge 80 ]; then
		    printf "$icon_charge_tier8_charging"

	      elif [ $percentage -ge 70 ]; then
		    printf "$icon_charge_tier7_charging"
	    
        elif [ $percentage -ge 60 ]; then
		    printf "$icon_charge_tier6_charging"
	
        elif [ $percentage -ge 50 ]; then
	    	printf "$icon_charge_tier5_charging"
        
        elif [ $percentage -ge 40 ]; then
	    	printf "$icon_charge_tier4_charging"
	
        elif [ $percentage -ge 30 ]; then
    		printf "$icon_charge_tier3_charging"

        elif [ $percentage -ge 20 ]; then
    		printf "$icon_charge_tier2_charging"
	
        elif [ $percentage -gt 10 ]; then 
    		printf "$icon_charge_tier1_charging"
	
        else
    		printf "$icon_charge_tier0_charging"                             # minimun
    	fi
  
    else

        if [ $percentage -ge 100 -o "$percentage" == "" ]; then
		    # if percentage is empty, assume it's a desktop         # maximum
		    printf "$icon_charge_tier10_default"
        
        elif [ $percentage -ge 90 ]; then
		    printf "$icon_charge_tier9_default"
	
        elif [ $percentage -ge 80 ]; then
		    printf "$icon_charge_tier8_default"

	      elif [ $percentage -ge 70 ]; then
		    printf "$icon_charge_tier7_default"
	    
        elif [ $percentage -ge 60 ]; then
		    printf "$icon_charge_tier6_default"
	
        elif [ $percentage -ge 50 ]; then
	    	printf "$icon_charge_tier5_default"
        
        elif [ $percentage -ge 40 ]; then
	    	printf "$icon_charge_tier4_default"
	
        elif [ $percentage -ge 30 ]; then
    		printf "$icon_charge_tier3_default"

        elif [ $percentage -ge 20 ]; then
    		printf "$icon_charge_tier2_default"
	
        elif [ $percentage -gt 10 ]; then 
    		printf "$icon_charge_tier1_default"
	
        else
    		printf "$icon_charge_tier0_default"    
        fi 
    fi


}




main() {
	get_icon_charge_settings
	print_icon_charge_plus_status
}

main
