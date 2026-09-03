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

if [[ -z "$FILENAME" ]]; then
    echo "Error: La variable de ambiente FILENAME no esta definida."
    exit 1
fi

opcion=0
while [[ $opcion -ne 7 ]]; do
    echo "--- MENU ---"
    echo "1- Crear entorno"
    echo "2- Correr proceso"
    echo "3- Mostrar alumnos ordenados por padron"
    echo "4- Mostrar las 10 notas mas altas"
    echo "5- Buscar alumno por padron"
    echo "6- Visualizar log"
    echo "7- Salir"
    read -p "Seleccione una opcion: " opcion

    case $opcion in
        1)
            mkdir -p "$DIR_BASE"/{entrada,salida,procesado}
            echo "Carpetas creadas en $DIR_BASE."
            ;;
            
        2)
            if  [ ! -f  "$DIR_BASE/consolidar.sh"  ]; then
			cp ./consolidar.sh "$DIR_BASE/consolidar.sh"
			chmod +x "$DIR_BASE/consolidar.sh"
			echo "consolidar.sh copiado a $DIR_BASE"
	        fi

	        if pgrep -f "$DIR_BASE/consolidar.sh" > /dev/null; then
	    	echo "El proceso ya esta corriendo."
	        else
	    	nohup "$DIR_BASE/consolidar.sh" > /dev/null 2>&1 &
	    	echo $! > "$DIR_BASE/consolidar.pid"
	    	echo "Proceso iniciado en background (PID $!)"
	        fi
	        ;;
            
        3)
            sort -n -k1 "$FILENAME" 2>/dev/null || echo "Archivo no existe."
            ;;
            
        4)
                                     #sort -nr -k5 "$FILENAME" 2>/dev/null | head -n 10 || echo "Archivo no existe."
            if [ -f "$FILENAME" ]; then
                                     # primero escribo nota al frente antes de ordenar en caso de que haya nombres complejos o doble apellido
		    awk '{print $NF"\t"$0}' "$FILENAME" | sort -nr | cut -f2- | head -10
	        else
	    	echo "El archivo $FILENAME no existe en la carpeta salida."
	        fi
	        ;;
            
        5)
            read -p "Ingrese padron: " padron
            grep "$padron" "$FILENAME" 2>/dev/null || echo "Padron no encontrado."
            ;;
        6)
            cat "$DIR_BASE/salida/registro.log" 2>/dev/null || echo "Log vacio."
            ;;
            
        7)
            break
            ;;
        *)
            echo "Opcion invalida."
            ;;
    esac
done
