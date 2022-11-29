FROM python:3.8-alpine

RUN apk add python3-dev build-base linux-headers pcre-dev

WORKDIR /code
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install gunicorn uvicorn[standard] \
    && pip install -r requirements.txt

COPY polls/ polls/
COPY mysite_async/ mysite_async/
COPY manage.py manage.py
COPY gunicorn.web.conf.py gunicorn.web.conf.py

CMD ["python", "-m", "gunicorn", "--config=gunicorn.web.conf.py"]
