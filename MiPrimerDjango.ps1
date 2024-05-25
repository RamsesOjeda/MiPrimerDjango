# Ubicando en la carpeta de proyecto
cd D:\romPy\MiPrimerDjango\MiPrimerDjango
# Verificar el directorio
pwd
# Generar un entorno virtual en mi proyecto
python -m venv General
# Abriendo el entorno virtual
General\Scripts\activate.ps1
# Comprobar python
python --version
# Programas instalados
pip list
# Actualizando pip. Correr solo la primera vez
python -m pip install --upgrade pip
# Programas instalados
pip list
# # Visualizar los paquetes
cat requirements.txt
# Instalando paqutes requeridos. Correr solo la primera vez
pip install -r requirements.txt
# Programas instalados
pip list
# Comprobar instalacion de django. 
python
# Se corre dentro de python.
# import django
# print(django.get_version)
# Verificar version desde consola
py -m django --version
# Verificamos carpeta
pwd
# Creamos carpeta Principal
mkdir Principal
# Listamos las carpetas
ls
# Nos movemos a la carpeta principal
cd Principal
# Creamos el proyecto en dejango
django-admin startproject Cuestionarios
# Verificamos la ruta
ls
# Cambiamos a Cuestionarios que se acaba de crear.
cd Cuestionarios
# Comprobación de que corre el servidor
py manage.py runserver
###############################################
# Para salir hay que teclear Ctrl + c
# Cada vez que quieras que se vea tienes que dejar este servidor prendido
###############################################
# Verificar la ruta
pwd
# listar los archivos
ls
# Crea la aplicación polls
py manage.py startapp polls
# Se modifica los archivos polls/views.py, se crea el archivo polls/urls.py
# de la aplicacion de polls
# Se modifica el archivo Cuestionarios/urls.py del proyecto Cuestionarios
# Se corre el servidor para poder ver el resultado
py manage.py runserver
# Se configura la informacion del servidor postgresSQL antes de migrar el 
# modelo ya que necesita esta configuración para generar la base de datos
# y su modelo.


# Cerrar entorno. No necesitas referir la ubicacón para desactivarlo.
deactivate