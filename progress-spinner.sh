#!/bin/bash
## i have used `tput civis`  for hide cursor and for normal state `tupt cnorm`
## Note: for "tput" function first you should install **ncurses-utils** package.. then you can use the code..

spin () {

local pid=$!
local delay=0.05
local spinstr='|/-\'
while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
	tput civis
        printf "\e[1;34m\r[*] \e[1;32mit will take time..Please wait...  [\e[1;33m%c\e[1;32m]\e[0m  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "   \b\b\b"
    tput cnorm
    printf "\e[1;33m[Done]\e[0m"
    echo ""
}
(sleep 10) &> /dev/null &
spin
