[comment]: <> (<xdg-opn "fichero.txt" - para abrir un fichero con la terminal> )

# Bucle de impresiones de root
```bash
if [ "$(whoami)" != "root" ]; then
    # Obtiene el tamaño del directorio de inicio del usuario
    size=$(du -sh "$HOME" | awk '{print $1}')
    # Obtiene el nombre del directorio de inicio del usuario
    dir_name=$(basename "$HOME")
    # Muestra un mensaje informativo
    echo "Almacen Usuario"
    # Muestra el tamaño del directorio de inicio y el nombre de usuario
    echo "$size  $dir_name"
    # Retorna un código de error (1)
    return 1
fi
```


Este código es un fragmento de un script de shell que realiza las siguientes acciones:

1. Verifica si el usuario actual no es el superusuario (root).
2. Calcula el tamaño del directorio de inicio del usuario y lo almacena en la variable `size`.
3. Obtiene el nombre del directorio de inicio del usuario y lo almacena en la variable `dir_name`.
4. Muestra un mensaje informativo "Almacen Usuario".
5. Muestra el tamaño del directorio de inicio y el nombre de usuario.
6. Retorna un código de error (1) si el usuario no es root.

El código está marcado como un bloque de código en Markdown para resaltarlo y hacerlo más legible.


```bash
for dir in /home/*; do
    # Verifica si el elemento es un directorio
    if [ -d "$dir" ]; then
        # Calcula el tamaño del directorio y almacena en 'size'
        size=$(du -sh "$dir" | awk '{print $1}')
        # Obtiene el nombre del directorio
        dir_name=$(basename "$dir")
        # Muestra el tamaño y el nombre del directorio
        echo "$size  $dir_name"
    fi
done
```


Este código es un fragmento de un script de shell que realiza las siguientes acciones:

1. Utiliza un bucle `for` para iterar a través de todos los elementos (directorios y archivos) en el directorio `/home`.
2. Verifica si el elemento actual (`$dir`) es un directorio.
3. Si el elemento es un directorio, calcula su tamaño utilizando el comando `du`, almacenando el resultado en la variable `size`, y obtiene el nombre del directorio almacenándolo en la variable `dir_name`.
4. Muestra el tamaño del directorio y el nombre del directorio en la salida estándar.
5. Continúa iterando a través de los elementos en `/home` hasta que se procesen todos los directorios.

El código está marcado como un bloque de código en Markdown para resaltarlo y hacerlo más legible.
