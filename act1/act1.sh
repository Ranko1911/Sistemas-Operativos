#!/bin/bash

##### Opciones por defecto
filename=~/sysinfo.txt


##### Constantes
TITLE="Información del sistema para $HOSTNAME" # $HOSTNAME muestra el nombre del host
RIGHT_NOW=$(date +"%x %r%Z") # date muestra la fecha y hora actual
TIME_STAMP="Actualizada el $RIGHT_NOW por $USER" # muestra el nombre del usuario actual con la fecha y hora actual

##### Estilos

TEXT_BOLD=$(tput bold) # tput bold hace que el texto sea negrita
TEXT_GREEN=$(tput setaf 2) # tput setaf 2 hace que el texto sea verde
TEXT_RESET=$(tput sgr0) # tput sgr0 hace que el texto sea normal
TEXT_ULINE=$(tput sgr 0 1) # tput sgr 0 1 hace que el texto sea subrayado

##### Funciones

programaArgumentado(){ # esta funcion hace lo mismo que programa pero cambiando los argumentos de strace
  echo "programaArgumentado $@"
}

usage()
{
  echo "Usage: scdebug [-h] [-sto arg] [-v | -vall] [-nattch progtoattach] [prog [command][arg1 …]]"
}

shift(){
  echo "shift"
}

verbose(){
  echo "verbose"
}

nache(){
  echo "nache $filename"
}

programa() {
  if [ $# -eq 0 ]; then
    echo "La función 'prog' fue llamada sin argumentos."
    exit 1
  else
    echo "La función 'prog' fue llamada con argumentos: $@"
  fi

  if [ -d "/scdebug" ]; then # comprobar que la carpeta scdebug existe
    echo "La carpeta scdebug existe."
  else
    echo "La carpeta scdebug no existe."
    echo "mkdir scdebug"
    $(mkdir scdebug 2> /dev/null)
  fi

  if [ -d "/scdebug/$1" ]; then # comprobar que la carpeta scdebug/$1 existe
    echo "La carpeta $1 existe."
  else
    echo "La carpeta $1 no existe."
    echo "mkdir scdebug/$1"
    $(mkdir scdebug/$1 2> /dev/null)
  fi

  uuid=$(uuidgen)
  echo "strace -o scdebug/$1/trace_$uuid.txt $@"
  $(strace -o scdebug/$1/trace_$uuid.txt $@)
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi


# Procesar la línea de comandos del script para leer del script las opciones
while [ "$1" != "" ]; do
  case $1 in
    -h | --help )           
      usage
      exit
      ;;
    -sto | --stop )
      shift
      programaArgumentado "${@:3}"
      exit
      ;;
    -v | -vall )            
      verbose
      exit
      ;;
    -nattche )           
      filename=$2
      nache
      exit
      ;;
    prog )
      programa "${@:2}"
      exit
      ;;
    * )
      usage
      exit 1
    esac
    shift # elimina el argumento que se acaba de procesar de la lista de argumentos
done

# ps | grep sleep | tr -s ' ' | cut -d ' ' -f2