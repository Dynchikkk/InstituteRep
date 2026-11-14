from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.views.generic import DeleteView, DetailView, UpdateView
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

    # Повторный вывод формы сохраняет введённые значения и показывает ошибки проверки.
    return render(request, 'catalog/create.html', {'form': form})


# Представление страницы товара: находит запись по ID из URL и передаёт её в шаблон.
class ProductDetailView(DetailView):
    model = Product
    template_name = 'catalog/product_detail.html'
    context_object_name = 'product'


# Представление редактирования товара: заполняет ProductForm текущими данными и сохраняет изменения.
class ProductUpdateView(UpdateView):
    model = Product
    form_class = ProductForm
    template_name = 'catalog/create.html'

    def form_valid(self, form):
        response = super().form_valid(form)
        # Новые картинки дополняют галерею, прежние остаются на месте.
        for image in form.cleaned_data['images']:
            ProductImage.objects.create(product=self.object, image=image)
        return response


# Представление удаления товара: выводит подтверждение и возвращает в каталог после удаления.
class ProductDeleteView(DeleteView):
    model = Product
    template_name = 'catalog/product_delete.html'
    context_object_name = 'product'
    success_url = reverse_lazy('catalog')
