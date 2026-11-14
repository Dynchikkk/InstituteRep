from django.shortcuts import render


def index(request):
    return render(request, 'main/index.html')


def about(request):
    return render(request, 'main/about.html')


def catalog(request):
    return render(request, 'main/catalog.html')


def game(request):
    return render(request, 'main/game.html')


def delivery(request):
    return render(request, 'main/delivery.html')


def contacts(request):
    return render(request, 'main/contacts.html')
