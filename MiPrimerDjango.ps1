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
# Migra el modelo para crear la base de datos y el modelo de datos.
py manage.py migrate
# Se genera el modelo de la app Polls en polls/models.py y se agrega a la 
# configuración del proyecto cuestionario en el archivo settings.py la
# aplicación polls en INSTALLED_APPS al projecto polls polls.apps.PollsConfig
# Migra el modelo de la app Polls al proyecto Cuestionarios
py manage.py makemigrations polls
# Este comando te indica la ruta donde quedan registrados los cambios 
# de la migración en este caso polls/migrations/0001_initial.py
# Para visualizar las migraciones podemos usar un comando que muestra
# el código que se generara para la migración en sql.
py manage.py sqlmigrate polls 0001
# también éxiste un comando para checar problemas.
py manage.py check
# No mando problemas continuamos con la migración del modelo a la base 
# de datos de polls.
# Migra el modelo integrado del proyecto con la app polls al modelo de la
# base de datos y crea las tablas.
py manage.py migrate
# Usaremos el shell de Django para explorar la base con el Shell de python
# No lo haremos directo en la linea de comandos llamando a python porque 
# Este shell nos da herramientas directas al modelo del proyecto sin tener
# que llamarlos de forma coplicada directamente en la consola.
py manage.py shell
# Las siguientes consultas se realizaran en el shell para explorar
###########################################################################
# >>> from polls.models import Choice, Question  # Import the model classes we just wrote.
# No questions are in the system yet.
# >>> Question.objects.all()
# <QuerySet []>
# Create a new Question.
# Support for time zones is enabled in the default settings file, so
# Django expects a datetime with tzinfo for pub_date. Use timezone.now()
# instead of datetime.datetime.now() and it will do the right thing.
# >>> from django.utils import timezone
# >>> q = Question(question_text="What's new?", pub_date=timezone.now())
# Save the object into the database. You have to call save() explicitly.
# >>> q.save()
# Now it has an ID.
# >>> q.id
# 1
# Access model field values via Python attributes.
# >>> q.question_text
# "What's new?"
# >>> q.pub_date
# datetime.datetime(2012, 2, 26, 13, 0, 0, 775217, tzinfo=datetime.timezone.utc)
# Change values by changing the attributes, then calling save().
# >>> q.question_text = "What's up?"
# >>> q.save()
# objects.all() displays all the questions in the database.
# >>> Question.objects.all()
# <QuerySet [<Question: Question object (1)>]>
###########################################################################
# Una vez realizadas estas pruebas se modifica polls en el archivo models
# para ingresar una autoreferencia y no nos arroje
# <QuerySet [<Question: Question object (1)>]>
# Tambien agregamos a datetame utileria de Python
# Agregamos referencias a la utileria de Django de zonas horarias
# Volvemos a llamar al shell para poder visualizar los cambios.
py manage.py shell
# Las siguientes consultas se realizaran en el shell para explorar
###########################################################################
# >>> from polls.models import Choice, Question
# # Make sure our __str__() addition worked.
# >>> Question.objects.all()
# <QuerySet [<Question: What's up?>]>
# # Django provides a rich database lookup API that's entirely driven by
# # keyword arguments.
# >>> Question.objects.filter(id=1)
# <QuerySet [<Question: What's up?>]>
# >>> Question.objects.filter(question_text__startswith="What")
# <QuerySet [<Question: What's up?>]>
# # Get the question that was published this year.
# >>> from django.utils import timezone
# >>> current_year = timezone.now().year
# >>> Question.objects.get(pub_date__year=current_year)
# <Question: What's up?>
# # Request an ID that doesn't exist, this will raise an exception.
# >>> Question.objects.get(id=2)
# Traceback (most recent call last):
#     ...
# DoesNotExist: Question matching query does not exist.
# # Lookup by a primary key is the most common case, so Django provides a
# # shortcut for primary-key exact lookups.
# # The following is identical to Question.objects.get(id=1).
# >>> Question.objects.get(pk=1)
# <Question: What's up?>
# # Make sure our custom method worked.
# >>> q = Question.objects.get(pk=1)
# >>> q.was_published_recently()
# True
# # Give the Question a couple of Choices. The create call constructs a new
# # Choice object, does the INSERT statement, adds the choice to the set
# # of available choices and returns the new Choice object. Django creates
# # a set (defined as "choice_set") to hold the "other side" of a ForeignKey
# # relation (e.g. a question's choice) which can be accessed via the API.
# >>> q = Question.objects.get(pk=1)
# # Display any choices from the related object set -- none so far.
# >>> q.choice_set.all()
# <QuerySet []>
# # Create three choices.
# >>> q.choice_set.create(choice_text="Not much", votes=0)
# <Choice: Not much>
# >>> q.choice_set.create(choice_text="The sky", votes=0)
# <Choice: The sky>
# >>> c = q.choice_set.create(choice_text="Just hacking again", votes=0)
# # Choice objects have API access to their related Question objects.
# >>> c.question
# <Question: What's up?>
# # And vice versa: Question objects get access to Choice objects.
# >>> q.choice_set.all()
# <QuerySet [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]>
# >>> q.choice_set.count()
# 3
# # The API automatically follows relationships as far as you need.
# # Use double underscores to separate relationships.
# # This works as many levels deep as you want; there's no limit.
# # Find all Choices for any question whose pub_date is in this year
# # (reusing the 'current_year' variable we created above).
# >>> Choice.objects.filter(question__pub_date__year=current_year)
# <QuerySet [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]>
# # Let's delete one of the choices. Use delete() for that.
# >>> c = q.choice_set.filter(choice_text__startswith="Just hacking")
# >>> c.delete()
###########################################################################

# Cerrar entorno. No necesitas referir la ubicacón para desactivarlo.
deactivate