FROM debian:bullseye
RUN apt-get update && \ 
    apt-get install -y nginx

WORKDIR /etc/nginx/sites-available/
RUN rm default
COPY default .

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]