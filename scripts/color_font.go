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

// #132A40

func print_battery_status_bg () {

    status, err := exec.Command("pmset", "-g", "batt").Output()
    if err != nil {
        panic(err)
    }

    battery_status := strings.Split(strings.Split(string(status), ";")[1], ";")[0]
    
    if battery_status == " charging" || battery_status == "AC attached"  {
        fmt.Println("#132A40")

    } else {

        percentage := strings.Split(strings.Split(string(status), "%")[0], "\t")[1]
        percentag, err := strconv.Atoi(percentage)
    
        if err != nil {
            panic(err)
        }

        switch {
   
            case percentag <= 36 && percentag >= 16:
                fmt.Println("#e1e1e1")
    
            case percentag <= 15:
                fmt.Println("#e1e1e1")
            
            default:
                fmt.Println("#132A40")

        }
    }
}
