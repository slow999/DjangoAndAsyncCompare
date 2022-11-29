FROM python:3.8-alpine

RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip install --upgrade pip

WORKDIR /code
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install uwsgi \
    && pip install -r requirements.txt

COPY polls/ polls/
COPY mysite_sync/ mysite_sync/
COPY manage.py manage.py
COPY mysite.uwsgi.ini mysite.uwsgi.ini


CMD ["uwsgi", "--ini", "/code/mysite.uwsgi.ini"]
