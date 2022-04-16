#!/bin/bash
engine=$(ibus engine)

# Set your engine here
ENGLISH="xkb:us::eng"
PUNJABI="xkb:in:guru:pan"
UKRAINIAN="xkb:ua::ukr"

if [[ "$engine" == "$ENGLISH" ]]; then
    ibus engine $PUNJABI
    polybar-msg hook ibus 1 &>/dev/null || true
    #  Comment line below if you dont want to recive notification
    dunstify -h string:x-dunst-stack-tag:ibus -A 'ibus,default' -a "IBUS" -i "~/.config/polybar/scripts/flags/246-india.svg" "PU"
elif [[ "$engine" == "$UKRAINIAN" ]]; then
    ibus engine $ENGLISH
    polybar-msg hook ibus 1 &>/dev/null || true
    #  Comment line below if you dont want to recive notification
    dunstify -h string:x-dunst-stack-tag:ibus -A 'ibus,default' -a "IBUS" -i "~/.config/polybar/scripts/flags/226-united-states.svg" "US"
elif [[ "$engine" == "$PUNJABI" ]]; then
    ibus engine $UKRAINIAN
    polybar-msg hook ibus 1 &>/dev/null || true
    dunstify -h string:x-dunst-stack-tag:ibus -A 'ibus,default' -a "IBUS" -i "~/.config/polybar/scripts/flags/145-ukraine.svg" "UA"
fi
