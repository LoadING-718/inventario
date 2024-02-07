#!/bin/bash

cd /app

$ python manage.py collectstatic --noinput --verbose
#para recopilar todos los archivos estáticos de todas las aplicaciones del proyecto
# y almacenarlos en un único directorio
#Identificar errores o problemas que impidan recojer los archivo estaticos
python manage.py migrate

python manage.py runserver 0.0.0.0:8000

exec "$@" #ejecutará la orden dada por los parámetros