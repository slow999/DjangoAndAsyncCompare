FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled/ /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]