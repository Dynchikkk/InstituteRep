from django.http import HttpResponse


def index(request):
    return HttpResponse('Главная страница магазина настольных игр.')


def about(request):
    return HttpResponse('О магазине: у нас можно выбрать настольные игры для семьи и друзей.')
