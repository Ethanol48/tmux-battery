// I need to have the output of the file bg_color_code.sh which is in the same 
// directory as this file, and I wanted to be asigned to variable called "ABC" 

package main

import "os/exec"
import "fmt" 

func main() {
    ABC, err := exec.Command("sh", "bg_color_code.sh").Output()
    if err != nil {
        fmt.Println(err)
    }
    fmt.Printf("%s",ABC)
}
