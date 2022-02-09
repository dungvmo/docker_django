from django.db import models


class Author(models.Model):
    name = models.CharField(max_length=255)
    birthday = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.name


class Book(models.Model):
    name = models.CharField(max_length=255)
    published_date = models.DateField(blank=True, null=True)
    price = models.IntegerField()
    author = models.ForeignKey(Author, related_name="own_books", on_delete=models.CASCADE)
