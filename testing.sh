#!/bin/bash 


#echo $(du -c | tail -n 1 | cut -f1)

# sysinfo - Un script que informa del estado del sistema


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

system_info()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Versión del sistema${TEXT_RESET}"
	echo
	uname -a # uname muestra información sobre el sistema
        echo "----------------------------------------------------"

}


show_uptime()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Tiempo de encendido del sistma${TEXT_RESET}"
	echo $(uptime) # uptime muestra el tiempo que lleva el sistema encendido
	echo "----------------------------------------------------"
}


drive_space()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Espacio ocupado del sistema${TEXT_RESET}"
	echo $(df -h | tr -s ' ' | cut -d ' ' -f 2,6) # df -h muestra el espacio ocupado en el sistema
        echo "----------------------------------------------------"
	
}

home_space()
{
    # Función para mostrar el espacio ocupado en los subdirectorios de /home

    echo "${TEXT_ULINE}Espacio ocupado en /home por subdirectorios${TEXT_RESET}"
    echo

    # Verificar si el usuario es root
    if [ "$(whoami)" != "root" ]; then # si el usuario no es root entonces solo mostrar el espacio ocupado por su directorio
            size=$(du -sh "$HOME" | awk '{print $1}') # du -sh muestra el espacio ocupado por el directorio en el que se encuentra
            dir_name=$(basename "$HOME") # basename muestra el nombre del directorio en el que se encuentra
			echo "Almacen Usuario" 
            echo "$size  $dir_name"
        return 1
    fi

    # Iterar a través de los subdirectorios en /home y mostrar el espacio ocupado
    for dir in /home/*; do # * significa que se iterará a través de todos los subdirectorios
        if [ -d "$dir" ]; then # -d significa que es un directorio
            size=$(du -sh "$dir" | awk '{print $1}') # du -sh muestra el espacio ocupado por el directorio en el que se encuentra
            dir_name=$(basename "$dir") # basename muestra el nombre del directorio en el que se encuentra
            echo "$size  $dir_name" 
        fi
    done

    echo "----------------------------------------------------"
}

##### Programa principal

cat << _EOF_
$TEXT_BOLD$TITLE$TEXT_RESET

$TEXT_GREEN$TIME_STAMP$TEXT_RESET
_EOF_

system_info
show_uptime
drive_space
home_space

