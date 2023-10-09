#!/bin/bash 


#echo $(du -c | tail -n 1 | cut -f1)

# sysinfo - Un script que informa del estado del sistema


##### Constantes


TITLE="Información del sistema para $HOSTNAME"
RIGHT_NOW=$(date +"%x %r%Z")
TIME_STAMP="Actualizada el $RIGHT_NOW por $USER"

##### Estilos

TEXT_BOLD=$(tput bold)
TEXT_GREEN=$(tput setaf 2)
TEXT_RESET=$(tput sgr0)
TEXT_ULINE=$(tput sgr 0 1)

##### Funciones

system_info()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Versión del sistema${TEXT_RESET}"
	echo
	uname -a
        echo "----------------------------------------------------"

}


show_uptime()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Tiempo de encendido del sistma${TEXT_RESET}"
	echo $(uptime)
	echo "----------------------------------------------------"
}


drive_space()
{
	# Función de stub temporal
	echo "${TEXT_ULINE}Espacio ocupado del sistema${TEXT_RESET}"
	echo $(df -h | tr -s ' ' | cut -d ' ' -f 2,6)
        echo "----------------------------------------------------"
	
}


home_space()
{
	# Función de stub temporal
	echo "home space"

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

