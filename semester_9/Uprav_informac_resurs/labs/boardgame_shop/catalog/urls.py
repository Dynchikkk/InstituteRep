from django.urls import path
from catalog import views


urlpatterns = [
    path('', views.index, name='catalog'),
    path('create/', views.create, name='product_create'),
    path('<int:pk>/', views.ProductDetailView.as_view(), name='product_detail'),
    path('<int:pk>/update/', views.ProductUpdateView.as_view(), name='product_update'),
    path('<int:pk>/delete/', views.ProductDeleteView.as_view(), name='product_delete'),
]
