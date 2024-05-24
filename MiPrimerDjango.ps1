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
# Cerrar entorno. No necesitas referir la ubicacón para desactivarlo.
deactivate