#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[37m
████████████████████████████████████████████
█▄─▄─▀█▄─▄█▄─▀█▄─▄███▄─▄█▄─▀█▄─▄█▄─▄▄─█─▄▄─█
██─▄─▀██─███─█▄▀─█████─███─█▄▀─███─▄███─██─█
▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀▄▄▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▀\e[0m"

echo -e "\e[1;34mBIN INFORMACIÓN BY KINGBOY\e[0m"

###### echo -e "\e[1;33mOBTEN INFORMACIÓN DE UN BIN\e[0m"

# Verificar que se proporcione un argumento al script
if [ $# -ne 1 ] || [ ${#1} -ne 6 ]; then
    echo "Ingresa el BIN de 6 dígitos"
    exit 1
fi

# Realizar la solicitud a un servicio en línea para obtener la información del BIN
response=$(curl -s "https://lookup.binlist.net/$1")

# Verificar si se recibió una respuesta válida
if [ -z "$response" ]; then
    echo "No se pudo obtener información para el BIN $1. Por favor, verifica el número de BIN."
    exit 1
fi

# Extraer y mostrar el nombre del banco y el país usando la herramienta jq
bank=$(echo $response | jq -r '.bank.name')
country=$(echo $response | jq -r '.country.name')

# Mostrar la información del BIN
echo "El BIN $1 pertenece al banco $bank en $country."

#### By: echo -e "\e[1;33mKINGBOY\e[0m"
