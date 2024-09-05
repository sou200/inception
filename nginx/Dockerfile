FROM debian:bullseye
RUN apt-get update && \ 
    apt-get install -y nginx

WORKDIR /etc/nginx/sites-available/
RUN rm default
COPY default .

CMD [ "nginx", "-g" ,"daemon off;" ]