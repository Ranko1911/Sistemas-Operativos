#!/bin/bash

echo -n "Introduce un numero entre 1 y 3, ambos incluidos: "
read numero
if [ $numero -eq 1 ]; then
    echo "Has introducido el numero 1"
elif [ $numero -eq 2 ]; then
    echo "Has introducido el numero 2"
elif [ $numero -eq 3 ]; then
    echo "Has introducido el numero 3"
else
    echo "No has introducido un numero entre 1 y 3"
fi

echo -n "Introduce un número entre 1 y 3, ambos incluidos > "
read character
case "$character" in
    1 ) echo "Has introducido un uno."
        ;;
    2 ) echo "Has introducido un dos."
        ;;
    3 ) echo "Has introducido un tres."
        ;;
    * ) echo "No has introducido un número dentro del rango."
esac

echo -n "Escribe un digito o una letra > "
read character
case "$character" in
    [0-9] ) echo "Has introducido un digito."
        ;;
    [a-z] ) echo "Has introducido una letra minuscula."
        ;;
    [A-Z] ) echo "Has introducido una letra mayuscula."
        ;;
    * ) echo "No has introducido un digito o una letra."
esac

number=0
while [ $number -lt 10 ]; do
    echo "WHILE --- numero es $number"
    number=$((number+1))
done

number=0
until [ $number -ge 10 ]; do
    echo "UNTIL --- El numero es $number"
    number=$((number+1))
done

for i in word1 word2 word3; do
    echo $i
done

