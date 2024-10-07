FROM debian:bullseye
RUN apt-get update && \ 
    apt-get install -y nginx

COPY default /etc/nginx/sites-available/default

EXPOSE 80

ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]