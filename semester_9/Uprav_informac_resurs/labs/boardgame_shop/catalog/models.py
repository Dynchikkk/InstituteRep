from django.db import models
from django.core.validators import MinValueValidator
from django.utils import timezone


class Product(models.Model):
    title = models.CharField('Название', max_length=100)
    short_description = models.CharField('Краткое описание', max_length=250)
    description = models.TextField('Полное описание')
    price = models.DecimalField('Цена', max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])
    created_at = models.DateTimeField('Дата добавления', default=timezone.now)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Товар'
        verbose_name_plural = 'Товары'
