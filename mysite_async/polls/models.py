from django.db import models

# Create your models here.
class Foo(models.Model):
    a = models.CharField(max_length=200)