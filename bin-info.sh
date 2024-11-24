#!/bin/bash

echo -e "\e[37m
████████████████████████████████████████████
█▄─▄─▀█▄─▄█▄─▀█▄─▄███▄─▄█▄─▀█▄─▄█▄─▄▄─█─▄▄─█
██─▄─▀██─███─█▄▀─█████─███─█▄▀─███─▄███─██─█
▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀▄▄▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▀\e[0m"

echo -e "\e[1;34mBIN INFORMACIÓN BY KINGBOY\e[0m"

###### echo -e "\e[1;33mOBTEN INFORMACIÓN DE UN BIN\e[0m"

while true; do
    # Solicitar al usuario que ingrese el BIN
    read -p "Ingresa el BIN a consultar: " bin

    # Realizar la consulta al servicio binlist.net
    response=$(curl -s "https://lookup.binlist.net/$bin")

    # Extraer la información relevante del resultado de la consulta
    country=$(echo $response | jq -r '.country.name')
    bank=$(echo $response | jq -r '.bank.name')
    type=$(echo $response | jq -r '.type')
    category=$(echo $response | jq -r '.category')

    # Mostrar la información obtenida al usuario
    echo "País: $country"
    echo "Banco: $bank"
    echo "Tipo de tarjeta: $type"
    echo "Categoría: $category"

    # Preguntar al usuario si desea realizar otra consulta
    read -p "¿Deseas realizar otra consulta? (s/n): " option
    if [ "$option" != "s" ]; then
        break
    fi
done

echo "¡Gracias por utilizar el script de consulta de BINs!"

#### By: echo -e "\e[1;33mKINGBOY\e[0m"
