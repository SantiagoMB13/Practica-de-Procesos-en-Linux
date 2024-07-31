#!/bin/bash
mi_pid=$$
padre_pid=$PPID
echo "Entra a [Suma] el hijo PID: $mi_pid de padre PID: $padre_pid"
if [ $# -lt 2 ]; then
    echo "Uso: $0 num1 [num2] ... [numN]"
    exit 1
fi
good=1
for num in "$@"; do
	if [[ $num =~ ^[0-9]+$ ]]; then
		:
	else
		good=0
	fi
done
if [ "$good" -eq 0 ]; then
	echo "Solo puedes ingresar números como argumentos"
	exit 1
fi
suma=0
total=0
for num in "$@"; do
    echo "Número en el hijo: $num"
	suma=$((suma + num))
	((total++))
done
promedio=$(echo "scale=4; $suma / $total" | bc)
echo "Suma final: $suma y Promedio: $promedio"
while true
do
 :
done
