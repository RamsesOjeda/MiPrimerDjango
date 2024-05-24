from django.urls import path
# Se importa views para poder mostrar el mensaje
from . import views

urlpatterns = [
    path("", views.index, name="index"),
]