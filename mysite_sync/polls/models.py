from django.db import models

# Create your models here.


class Foo(models.Model):
    id = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
    