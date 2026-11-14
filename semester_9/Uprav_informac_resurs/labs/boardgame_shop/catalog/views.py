from django.shortcuts import render
from catalog.models import Product

def index(request):
    # Сортируем товары по названию и выбираем первые пять записей.
    products = Product.objects.order_by('title')[:5]
    data = {'products': products}
    return render(request, 'catalog/catalog.html', data)
