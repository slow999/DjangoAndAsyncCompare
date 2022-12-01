from asgiref.sync import sync_to_async
from polls.models import Foo
from django.http import HttpResponse
import asyncio


def _find_count(value):
    return Foo.objects.filter(id__gte=value).count()

find_count = sync_to_async(_find_count, thread_sensitive=True)

async def index(request):
    count1 = await find_count(50)
    # count2 = await find_count(r'50')
    # await asyncio.sleep(2)
    return HttpResponse(count1)
