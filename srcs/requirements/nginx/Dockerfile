FROM debian:bullseye

RUN apt-get update && \ 
    apt-get install -y nginx openssl

RUN mkdir /home/ssl && \
    openssl req -x509 -newkey rsa:4096 -keyout /home/ssl/key.key -out /home/ssl/cert.crt \
    -days 3650 -nodes -subj "/C=MA/ST=RabatSaleKenitra/L=SidiTaibi/O=1337/CN=serhouni.42.fr"

COPY conf/default /etc/nginx/sites-available/

EXPOSE 443

ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]