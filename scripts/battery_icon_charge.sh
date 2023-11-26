#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
icon_charge_tier8=''
icon_charge_tier7=''
icon_charge_tier6=''
icon_charge_tier5=''
icon_charge_tier4=''
icon_charge_tier3=''
icon_charge_tier2=''
icon_charge_tier1=''

# script default variables
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

print_icon_charge() {
	percentage=$($CURRENT_DIR/battery_percentage.sh | sed -e 's/%//')
	if [ $percentage -ge 100 -o "$percentage" == "" ]; then
		# if percentage is empty, assume it's a desktop
		printf "$icon_charge_tier10"
	elif [ $percentage -ge 90 ]; then
		printf "$icon_charge_tier9"
  elif [ $percentage -ge 80 ]; then
		printf "$icon_charge_tier8"	
  elif [ $percentage -ge 70 ]; then
		printf "$icon_charge_tier7"
	elif [ $percentage -ge 60 ]; then
		printf "$icon_charge_tier6"
	elif [ $percentage -ge 50 ]; then
		printf "$icon_charge_tier5"
	elif [ $percentage -ge 40 ]; then
		printf "$icon_charge_tier4"
	elif [ $percentage -ge 30 ]; then
		printf "$icon_charge_tier3"
	elif [ $percentage -gt 20 ]; then
		printf "$icon_charge_tier2"
	elif [ $percentage -gt 10 ]; then
		printf "$icon_charge_tier1"
	else
		printf "$icon_charge_tier0"
	fi
}

main() {
	get_icon_charge_settings
	print_icon_charge
}


