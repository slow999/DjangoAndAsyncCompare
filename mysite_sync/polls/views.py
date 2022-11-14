import time
from django.http import HttpResponse


def index(request):
    time.sleep(2)
    return HttpResponse("Hello, world. You're at the polls index.")
