from polls.models import Foo
from django.http import HttpResponse


def index(request):
    count = Foo.objects.filter(id__gte=50).count()
    return HttpResponse(count)
