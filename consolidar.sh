#!/bin/bash

# Rutas de directorios y archivos de salida
DIR_ENTRADA="$HOME/EPNro1/entrada"
DIR_PROCESADO="$HOME/EPNro1/procesado"
FILENAME="$HOME/EPNro1/salida/datos_completos.txt"
LOG="$HOME/EPNro1/salida/registro.log"

# Bucle infinito (se ejecuta continuamente en segundo plano)
while true; do
    for archivo in "$DIR_ENTRADA"/*.txt; do
        # Verifica que exista al menos un archivo válido (evita errores si el patrón *.txt no encuentra nada)
        if [[ -f "$archivo" ]]; then
            # Anexa el contenido del nuevo archivo al consolidado general
            cat "$archivo" >> "$FILENAME"
            # Registra la fecha, hora y nombre del archivo procesado en el log
            echo "$(date): Archivo $(basename "$archivo") procesado." >> "$LOG"
            mv "$archivo" "$DIR_PROCESADO/"
        fi
    done
    sleep 5
done
