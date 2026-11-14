from django.shortcuts import redirect, render
from catalog.forms import ProductForm
from catalog.models import Product, ProductImage

def index(request):
    # Сортируем товары по названию и выбираем первые пять записей.
    products = Product.objects.order_by('title')[:5]
    data = {'products': products}
    return render(request, 'catalog/catalog.html', data)


def create(request):
    if request.method == 'POST':
        # Получаем значения полей и загруженный файл.
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save()
            # Каждую картинку сохраняем отдельной записью, связанной с товаром.
            for image in form.cleaned_data['images']:
                ProductImage.objects.create(product=product, image=image)
            return redirect('catalog')
    else:
        form = ProductForm()

    # При ошибках возвращаем заполненную форму с пояснениями.
    return render(request, 'catalog/create.html', {'form': form})
