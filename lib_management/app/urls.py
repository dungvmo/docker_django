from django.urls import include, path
from rest_framework import routers
from .views import AuthorViewSet, BookViewSet
from . import views

router = routers.DefaultRouter()
router.register(r'author', AuthorViewSet)
router.register(r'book', BookViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('', include(router.urls)),
    path('chat', views.index, name='index'),
    path('chat/<str:room_name>/', views.room, name='room'),
]
