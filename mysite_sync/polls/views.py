from polls.models import Foo
from django.http import HttpResponse
import time


def index(request):
    count1 = Foo.objects.filter(id__gte=50).count()
    # count2 = Foo.objects.filter(a__regex=r'50').count()
    # time.sleep(2)
    return HttpResponse(count1)
