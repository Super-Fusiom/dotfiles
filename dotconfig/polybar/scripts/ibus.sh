engine=$(ibus engine)

ENGLISH="xkb:us::eng"
PUNJABI="xkb:in:guru:pan"
UKRAINIAN="xkb:ua::ukr"

if [[ "$engine" == "$ENGLISH" ]]; then
    echo "EN"
elif [[ "$engine" == "$PUNJABI" ]]; then
    echo "PU"
elif [[ "$engine" == "$UKRAINIAN" ]]; then
    echo "UA"
fi
