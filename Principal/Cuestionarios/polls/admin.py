from django.contrib import admin

# Importa la instancia Quetion del modelo
from .models import Question

# Inserta esta instancia desde el modulo de administracion
admin.site.register(Question)