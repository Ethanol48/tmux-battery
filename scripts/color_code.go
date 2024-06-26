package main

import (
	"fmt"
	"strings"
    "strconv"
    "os/exec"
) 

func main() {
    print_battery_status_bg()
}

func print_battery_status_bg () {

    status, err := exec.Command("pmset", "-g", "batt").Output()
    if err != nil {
        panic(err)
    }

    battery_status := strings.Split(strings.Split(string(status), ";")[1], ";")[0]
    
    if battery_status == " charging" || battery_status == "AC attached"  {
        fmt.Println("#00CC22")

    } else {

        percentage := strings.Split(strings.Split(string(status), "%")[0], "\t")[1]
        percentag, err := strconv.Atoi(percentage)
    
        if err != nil {
            panic(err)
        }

        switch {

            case percentag == 100: 
                fmt.Println("#3AAD78")
    
            case percentag <= 99 && percentag >= 76:
                fmt.Println("#2BAD45")
    
            case percentag <= 75 && percentag >= 51:
                fmt.Println("#8fe639")
    
            case percentag <= 50 && percentag >= 36:
                fmt.Println("#ffd500")
    
            case percentag <= 36 && percentag >= 16:
                fmt.Println("#ff5500")
    
            case percentag <= 15:
                fmt.Println("#ff2A00")
        }

    }
}
/*
    color_charging :="00CC22"
    color_full_charge :="3AAD78"
    color_high_charge :="2BAD45"
    color_high_medium_charge :="8fe639"
    color_medium_charge :="FFD500" 
    color_low_charge :="FF5500"
    color_very_low_charge :="FF2A00"
*/ 

