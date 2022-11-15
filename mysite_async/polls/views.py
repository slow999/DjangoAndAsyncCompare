import asyncio
from django.http import HttpResponse


async def index(request):
    await asyncio.sleep(2)
    return HttpResponse("Hello, world. You're at the polls index.")
