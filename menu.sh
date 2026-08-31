#!/bin/bash

DIR_BASE="$HOME/EPNro1"
export FILENAME="$DIR_BASE/salida/datos_completos.txt"
LOG="$DIR_BASE/salida/registro.log"

if [[ "$1" == "-d" ]]; then
    echo "Eliminando entorno..."
    rm -rf "$DIR_BASE"
    pkill -f consolidar.sh
    echo "Entorno y procesos eliminados."
    exit 0
fi

opcion=0
while [[ $opcion -ne 5 ]]; do
    echo "--- MENÚ ---"
    echo "1) Crear entorno e iniciar proceso"
    echo "2) Ver datos consolidados"
    echo "3) Buscar por padrón"
    echo "4) Ordenar por notas"
    echo "5) Salir"
    read -p "Opción: " opcion

    case $opcion in
        1)
            mkdir -p "$DIR_BASE"/{entrada,salida,procesado}
            touch "$FILENAME" "$LOG"
            nohup ./consolidar.sh > /dev/null 2>&1 &
            echo "Entorno creado y trabajador iniciado."
            ;;
        2) cat "$FILENAME" 2>/dev/null || echo "Archivo vacío." ;;
        3) 
            read -p "Ingrese padrón: " padron
            grep "$padron" "$FILENAME" 
            ;;
        4) sort -k3 -n -r -t',' "$FILENAME" ;; 
        5) echo "Saliendo..." ;;
        *) echo "Opción inválida." ;;
    esac
done
