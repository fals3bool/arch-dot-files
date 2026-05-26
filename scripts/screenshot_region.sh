#!/bin/bash
file=~/Pictures/Screenshots/region_$(date +'%Y-%m-%d_%H-%M-%S').png

if maim -s "$file"; then
    if [ -s "$file" ] && xclip -selection clipboard -t image/png -i "$file"; then
        notify-send "Screenshot (región)" "Guardada en:\n$file\nCopiada al portapapeles" -i "$file"
    else
        notify-send "Screenshot (región)" "Guardada en:\n$file\n⚠️ No se pudo copiar al portapapeles" -i "$file"
    fi
else
    notify-send "Cancelado" "No se seleccionó ninguna región"
fi
