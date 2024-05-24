# Ubicando en la carpeta de proyecto
cd D:\romPy\MiPrimerDjango
# Verificar el directorio
pwd
# Iniciar directorio git
# git init
git remote add origin https://github.com/RamsesOjeda/MiPrimerDjango.git
# Generar un entorno virtual en mi proyecto
python -m venv MiPrimerDjango
# Abriendo el entorno virtual
MiPrimerDjango\Scripts\activate.ps1
# Cerrar entorno. No necesitas referir la ubicacón para desactivarlo.
deactivate
# Comprobar python
python --version
# Programas instalados
pip list
# Actualizando pip. Correr solo la primera vez
python -m pip install --upgrade pip
# Programas instalados
pip list
# # Visualizar los paquetes
# cat requirements.txt
# Instalando paqutes requeridos. Correr solo la primera vez
pip install -r requirements.txt
# Programas instalados
pip list