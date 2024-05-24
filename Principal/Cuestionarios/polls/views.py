from django.shortcuts import render
# Se agrega esta referencia para poder enviar un mensaje en navegador
from django.http import HttpResponse

# Se envia mensaje al navegador
def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
