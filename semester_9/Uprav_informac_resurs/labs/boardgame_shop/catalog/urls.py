from django.urls import path
from catalog import views


urlpatterns = [
    path('', views.index, name='catalog'),
    path('create/', views.create, name='product_create'),
    path('<int:pk>/', views.ProductDetailView.as_view(), name='product_detail'),
]
