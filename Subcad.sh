#!/bin/bash
mi_pid=$$
padre_pid=$PPID
echo "Entra a [Subcad] el hijo PID: $mi_pid de padre PID: $padre_pid"
if [ $# -lt 2 ]; then
    echo "Uso: $0 cad_objetivo cad_buscada"
    exit 1
fi
cadena_objetivo="$1"
echo "Cadena sobre la cual buscar [$cadena_objetivo]"
echo "Palabras que se buscarán en la cadena [${@:2}]"
total_coincidencias=0
for buscar in "${@:2}"; do
    coincidencias_encontradas=$(echo "$cadena_objetivo" | grep -o "$buscar" | sort -u | wc -l)
    if [ $coincidencias_encontradas -gt 0 ]; then
        echo "Cadena a buscar: $buscar"
        echo "Subcadena [$buscar] está en [$cadena_objetivo]"
        total_coincidencias=$((total_coincidencias + coincidencias_encontradas))
    else
        echo "Cadena a buscar: $buscar"
        echo "Subcadena [$buscar] no está en [$cadena_objetivo]"
    fi
done
echo "Número total de aciertos: $total_coincidencias"
while true
do
  :
done
