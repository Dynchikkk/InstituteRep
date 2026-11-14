from django.contrib import admin
from catalog.models import Product, ProductImage


# Картинки галереи загружаются прямо в форме товара.
class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductImageInline]


admin.site.register(Product, ProductAdmin)
