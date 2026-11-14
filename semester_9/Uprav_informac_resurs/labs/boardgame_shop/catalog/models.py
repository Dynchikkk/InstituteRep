from django.db import models
from django.core.validators import MinValueValidator
from django.urls import reverse
from django.utils import timezone


class Product(models.Model):
    title = models.CharField('Название', max_length=100)
    short_description = models.CharField('Краткое описание', max_length=250)
    description = models.TextField('Полное описание')
    price = models.DecimalField('Цена', max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])
    logo = models.ImageField('Лого / обложка', upload_to='products/logos/', blank=True)
    created_at = models.DateTimeField('Дата добавления', default=timezone.now)

    def __str__(self):
        return self.title

    # URL товара, на который UpdateView перенаправляет после сохранения изменений.
    def get_absolute_url(self):
        return reverse('product_detail', kwargs={'pk': self.pk})

    class Meta:
        verbose_name = 'Товар'
        verbose_name_plural = 'Товары'


class ProductImage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField('Изображение', upload_to='products/images/')
    caption = models.CharField('Подпись', max_length=150, blank=True)

    def __str__(self):
        return self.caption or f'Изображение товара «{self.product.title}»'

    class Meta:
        verbose_name = 'Изображение товара'
        verbose_name_plural = 'Изображения товара'
