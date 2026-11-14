from django.contrib import admin
from catalog.models import Product, ProductImage


# Встроенный редактор галереи на странице товара в админке.
class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductImageInline]


admin.site.register(Product, ProductAdmin)
