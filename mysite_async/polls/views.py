from asgiref.sync import sync_to_async
from polls.models import Foo
from django.http import HttpResponse


def _find_count(value):
    return Foo.objects.filter(id__gte=value).count()


find_count = sync_to_async(_find_count, thread_sensitive=True)


async def index(request):
    count = await find_count(50)
    return HttpResponse(count)
