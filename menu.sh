#!/bin/bash

# Directorio base y rutas principales
DIR_BASE="$HOME/EPNro1"
export FILENAME="$DIR_BASE/salida/datos_completos.txt"  # Exportada para ser leída por consolidar.sh
LOG="$DIR_BASE/salida/registro.log"

# Modo eliminación: detiene procesos en segundo plano y borra el entorno
if [[ "$1" == "-d" ]]; then
    echo "Eliminando entorno..."
    rm -rf "$DIR_BASE"
    pkill -f consolidar.sh
    echo "Entorno y procesos eliminados."
    exit 0
fi

# Validar variable de entorno requerida
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
            # Crea la estructura de directorios inicial
            mkdir -p "$DIR_BASE"/{entrada,salida,procesado}
            echo "Carpetas creadas en $DIR_BASE."
            ;;
            
        2)
            # Asegura la existencia del script y le da permisos
            if [ ! -f "$DIR_BASE/consolidar.sh" ]; then
                cp ./consolidar.sh "$DIR_BASE/consolidar.sh"
                chmod +x "$DIR_BASE/consolidar.sh"
                echo "consolidar.sh copiado a $DIR_BASE"
            fi

            # Evita ejecutar múltiples instancias del mismo proceso
            if pgrep -f "$DIR_BASE/consolidar.sh" > /dev/null; then
                echo "El proceso ya esta corriendo."
            else
                # Lanza el script en background descartando salidas y guarda el PID
                nohup "$DIR_BASE/consolidar.sh" > /dev/null 2>&1 &
                echo $! > "$DIR_BASE/consolidar.pid"
                echo "Proceso iniciado en background (PID $!)"
            fi
            ;;
            
        3)
            # Ordena numéricamente por la primera columna (Padrón)
            sort -n -k1 "$FILENAME" 2>/dev/null || echo "Archivo no existe."
            ;;
            
        4)
            if [ -f "$FILENAME" ]; then
                # Antepone la última columna ($NF, la nota) para ordenar correctamente
                # sin importar cuántas palabras tengan el nombre y apellido
                awk '{print $NF"\t"$0}' "$FILENAME" | sort -nr | cut -f2- | head -10
            else
                echo "El archivo $FILENAME no existe en la carpeta salida."
            fi
            ;;
            
        5)
            # Búsqueda directa por número de padrón
            read -p "Ingrese padron: " padron
            grep "$padron" "$FILENAME" 2>/dev/null || echo "Padron no encontrado."
            ;;
            
        6)
            # Muestra el archivo de registro si existe
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
