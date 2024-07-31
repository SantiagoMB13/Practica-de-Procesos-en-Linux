#!/bin/bash
mi_pid=$$
padre_pid=$PPID
echo "Entra a [Fibo] el hijo PID: $mi_pid de padre PID: $padre_pid"
if [ $# -ne 1 ]; then
    echo "Uso: $0 num-lim"
    exit 1
fi
if [[ $1 =~ ^[0-9]+$ ]]; then
	function fibonacci {
    	n=$1
    	a=0
    	b=1
    	for ((i = 0; i < n; i++)); do
		((j = $i + 1))
        	echo "Fibo $j = $a "
        	temp=$((a + b))
        	a=$b
        	b=$temp
    	done
	}

	fibonacci "$1"
else
	echo "Debes ingresar un número entero"
fi
while true
do
  :
done
