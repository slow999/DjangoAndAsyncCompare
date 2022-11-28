import asyncio
from django.http import HttpResponse


async def find_prime(start, stop):
    prime_list = []
    for val in range(start, stop):
        if val > 1:
            for i in range(2, int(val/2) + 1):
                if val % i == 0:
                    break
            else:
                prime_list.append(val)
    return prime_list


async def index(request):
    prime_numbers = await find_prime(1, 50000)
    return HttpResponse(len(prime_numbers))
