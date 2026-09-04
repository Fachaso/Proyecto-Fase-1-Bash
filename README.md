<div align="right">
    <img width="32px" src="img/logo_intro.desarrollo.software.png">
</div>

# Proyecto Fase 1 Bash
## Información de los estudiantes:

* Ramiro Tomas Martinez - 115961 - rtmartinez@fi.uba.ar - https://github.com/Fachaso
* Alan Fabrizio Messina Bossio - 116403 - amessina@fi.uba.ar
* 
* Lucas Nahuel Uran -116478 - luran@fi.uba.ar
* 
---

## Índice
* [0. Enunciado](#0-Enunciado)
* [1. Instrucciones](#1-Instrucciones)
* [2. Funcionamiento](#2-Funcionamiento)
* [3. Estructura](#3-Estructura)
* [4. Decisiones de diseño y/o complejidades de implementación](#4-Decisiones-de-diseño-yo-complejidades-de-implementación)


## 0. Enunciado
Se necesita realizar un script que permita mediante un menú realizar distintas operaciones sobre un sistema Linux o MacOS. 
Este script utilizará un parámetro optativo y una variable de ambiente llamada FILENAME para guardar el nombre de un archivo. 
El script debe manejar un menú con opciones
Este proyecto debe estar en su totalidad subido a un repositorio de GitHub, es un repositorio por grupo y debe ser público.

Opciones del menú:

opción 1) Crear entorno. Consiste en la creación de un directorio dentro del “home” que se llame “EPNro1”, dentro de este directorio deberán existir trescarpetas, una llamada “entrada”, otra “salida” y una última “procesado”

opción 2) Correr proceso. Se debe correr un proceso en background que ejecute un script llamado “consolidar.sh” que se encuentra en el directorio EPNro1, este script debe tomar cada archivo que ingresa en la carpeta “entrada” y adjuntar toda su información al final del archivo FILENAME.txt (donde FILENAME es una variable de entorno, previamente definida) que se encuentra en la carpeta “salida”. Luego de esa operación el archivo original se debe mover a la carpeta “procesado”.
El proceso deberá permanecer ejecutándose en background y revisar periódicamente la carpeta entrada. Cada vez que encuentre uno o más archivos .txt, deberá procesarlos y moverlos a procesado.

opción 3) Si existe el archivo FILENAME.txt en la carpeta salida, mostrar por pantalla el listado de alumnos ordenados por número de padrón.

opción 4) Si existe el archivo FILENAME.txt en la carpeta salida, mostrar por pantalla las 10 notas más altas del listado

opción 5) Solicitar al usuario un nro de padrón, y mostrar por pantalla, los datos del mismo provenientes del archivo FILENAME.txt de la carpeta salida.

opción 6) Visualizar log. El sistema debe contar con un archivo de log, donde el proceso consolidar.sh deberá registrar en EPNro1/procesado.log cada archivo procesado, indicando fecha y hora.
Formato:
18/08/2026 18:25:32 - Procesado archivo alumnos1.txt
18/08/2026 18:25:38 - Procesado archivo alumnos2.txt

opción 7) Salir 
parámetro optativo -d) Si el usuario corre el script con el parámetro optativo -d se borrará todo el entorno creado en la carpeta EPNro1 y se matarán los procesos creados en background.


Se toman las siguientes hipótesis.
- Los archivos que ingresan a la carpeta entrada pueden tener cualquier nombre, pero su extensión debe ser txt.
- El formato de los archivos de entrada deben respetar las siguientes columnas. (Nro_Padrón, Nombre y apellido, email, nota). No es necesario validarlo, se considera que están correctos.
- Los padrones son únicos y los registros no están repetidos.
- Se utilizará Bash shell.

Ejemplo de los archivos de entrada.
122332 Juan Lopez jlopez@fi.uba.ar 8
100998 Pedro Valdéz pvaldez@fi.uba.ar 5
89032 Carla Simone csimone@fi.uba.ar 7
77542 Franco Lomba flomba@fi.uba.ar 10
100223 Juana Pola jpola@fi.uba.ar 4
122435 Lucia Fernandez lfernandez@fi.uba.ar 9
…
…
…

## 1. Instrucciones
### 1.1. Compilar el proyecto
``` bash
    
```
###1.2. Para ejecutar 
```bash 
   ./tp
```



## 2. Funcionamiento



## 3. Estructura



## 4. Decisiones de diseño y/o complejidades de implementación
