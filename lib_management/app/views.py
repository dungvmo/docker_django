from rest_framework import viewsets
from rest_framework import permissions
from rest_framework.decorators import api_view

from .models import Author, Book
from .serializers import BookSerializer, AuthorSerializer

from django.shortcuts import render


class BookViewSet(viewsets.ModelViewSet):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    permission_classes = [permissions.AllowAny]


class AuthorViewSet(viewsets.ModelViewSet):
    queryset = Author.objects.all()
    serializer_class = AuthorSerializer
    permission_classes = [permissions.AllowAny]


@api_view(["GET"])
def index(request):
    return render(request, 'chat/index.html', {})


@api_view(["GET"])
def room(request, room_name):
    return render(request, 'chat/room.html', {
        'room_name': room_name
    })
