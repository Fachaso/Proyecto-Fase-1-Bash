#!/bin/bash

DIR_ENTRADA="$HOME/EPNro1/entrada"
DIR_PROCESADO="$HOME/EPNro1/procesado"
FILENAME="$HOME/EPNro1/salida/datos_completos.txt"
LOG="$HOME/EPNro1/salida/registro.log"

while true; do
    for archivo in "$DIR_ENTRADA"/*.txt; do
        if [[ -f "$archivo" ]]; then
            cat "$archivo" >> "$FILENAME"
            echo "$(date): Archivo $(basename "$archivo") procesado." >> "$LOG"
            mv "$archivo" "$DIR_PROCESADO/"
        fi
    done
    sleep 5
done
