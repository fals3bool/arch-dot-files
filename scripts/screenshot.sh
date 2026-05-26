#!/bin/bash
# file=~/Pictures/Screenshots/screenshot_$(date +'%d-%m-%Y_%H-%M-%S').png && \
# maim "$file" && \
# notify-send "Screenshot tomada" "Guardada en:\n$file" -i "$file"

file=~/Pictures/Screenshots/screenshot_$(date +'%d-%m-%Y_%H-%M-%S').png

if maim "$file"; then
    if xclip -selection clipboard -t image/png -i "$file"; then
        notify-send "Screenshot tomada" "Guardada en:\n$file\nCopiada al portapapeles" -i "$file"
    else
        notify-send "Screenshot tomada" "Guardada en:\n$file\n⚠️ No se pudo copiar al portapapeles" -i "$file"
    fi
else
    notify-send "Error" "No se pudo tomar la screenshot"
fi
