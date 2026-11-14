from django.shortcuts import render


def index(request):
    # Контекст главной страницы: название магазина и категории игр.
    data = {
        'title': 'Магазин настольных игр',
        'categories_title': 'Категории игр',
        'categories': ['Семейные', 'Стратегические', 'Кооперативные'],
    }
    return render(request, 'main/index.html', data)


def about(request):
    # Сведения о магазине, включая контакты и вложенный словарь характеристик.
    shop = {
        'name': 'Игры',
        'email': 'SHOP@EXAMPLE.COM',
        'details': {
            'Специализация': 'Настольные игры для семьи и друзей',
            'Время работы': 'Ежедневно с 10:00 до 19:00',
        },
    }
    data = {
        'title': 'О магазине',
        'shop': shop,
        'advantages': [
            'Игры для разных возрастов.',
            'Понятные описания и характеристики.',
            'Помощь в выборе игры для семьи или компании.',
        ],
    }
    return render(request, 'main/about.html', data)


def delivery(request):
    return render(request, 'main/delivery.html')


def contacts(request):
    return render(request, 'main/contacts.html')


def buttons(request):
    return render(request, 'main/buttons.html')
