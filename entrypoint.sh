#!/bin/bash

# Генерируем пароль и ссылку при каждом запуске
MYIP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
PROXY_PASSWD="$(perl -le 'print map { (a..z,A..Z,0..9)[rand 62] } 0..pop' 16)"
echo "proxy:${PROXY_PASSWD}" | chpasswd

echo "=========="
echo "Paste in telegram and click link below:"
echo ""
echo "tg://socks?server=$MYIP&port=1080&user=proxy&pass=${PROXY_PASSWD}"
echo ""
echo "=========="

# Запускаем danted
exec "$@"