from django import forms
from catalog.models import Product


# Разрешаем выбирать несколько файлов 
class MultipleImageInput(forms.ClearableFileInput):
    allow_multiple_selected = True


# Проверяем каждую картинку.
class MultipleImageField(forms.ImageField):
    def clean(self, data, initial=None):
        clean_image = super().clean
        if isinstance(data, (list, tuple)):
            return [clean_image(image, initial) for image in data]
        image = clean_image(data, initial)
        return [image] if image else []


class ProductForm(forms.ModelForm):
    images = MultipleImageField(
        label='Картинки товара',
        required=False,
        widget=MultipleImageInput(attrs={'class': 'form-control', 'accept': 'image/*'}),
        help_text='Необязательно. Можно выбрать несколько изображений сразу.',
    )

    class Meta:
        model = Product
        fields = ['title', 'short_description', 'description', 'price', 'logo', 'images', 'created_at']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'short_description': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 4}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'min': 0, 'step': '0.01'}),
            'logo': forms.ClearableFileInput(attrs={'class': 'form-control', 'accept': 'image/*'}),
            'created_at': forms.DateTimeInput(
                format='%Y-%m-%dT%H:%M',
                attrs={'class': 'form-control', 'type': 'datetime-local'},
            ),
        }
        help_texts = {'logo': 'Необязательно. Можно загрузить изображение товара.'}
