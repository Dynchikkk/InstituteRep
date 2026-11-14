from django.urls import path
from main import views


urlpatterns = [
    path('', views.index, name='home'),
    path('about/', views.about, name='about'),
    path('game/', views.game, name='game'),
    path('delivery/', views.delivery, name='delivery'),
    path('contacts/', views.contacts, name='contacts'),
    path('buttons/', views.buttons, name='buttons'),
]
