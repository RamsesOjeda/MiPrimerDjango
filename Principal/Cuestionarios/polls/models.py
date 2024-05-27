# Agregamos referencia al modelo estandar de tiempo de python
import datetime
# Hacmeos referencia a los modelos de la base de datos de django
from django.db import models
# Importamos la utileria de referencia de zona horaria de django
from django.utils import timezone

# Se crea el modelo Question con dos intancias: 
# question_text tipo caracter con un maximo de 100 caracteres
# pub_date tipo datetime
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
    # autorefenciamos para convertir en cadena y regresar 
    # la instancia question_text
    def __str__(self):
        return self.question_text
    # Agregamos una refernecia calculada sobre el dia anterior para 
    # ver si ha sido recientemente publicada.
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
# Se crea el modelo Choice con tres instancias:
# question tipo foreingkey
# choice_tet tipo caracter con un maximo de 200 caracteres
# votes tipo entero con valor default 0
class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    # autorefenciamos para convertir en cadena y regresar 
    # la instancia question_text
    def __str__(self):
        return self.choice_text

