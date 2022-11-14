wsgi_app = 'mysite_async.asgi:application'
worker_class = 'uvicorn.workers.UvicornWorker'
workers = 1
bind = 'unix:/tmp/gunicorn/gunicorn.sock'
accesslog = '-'
