from django.db import models


class Foo(models.Model):
    id = models.IntegerField()

    class Meta:
        managed = False
    