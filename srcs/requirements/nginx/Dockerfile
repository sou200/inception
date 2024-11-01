FROM debian:bullseye
RUN apt-get update && \ 
    apt-get install -y nginx openssl

RUN mkdir /home/ssl && \
    openssl req -x509 -newkey rsa:4096 -keyout /home/ssl/key.key -out /home/ssl/cert.crt \
    -sha256 -days 3650 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=serhouni.42.fr"

COPY conf/default /etc/nginx/sites-available/

EXPOSE 443

ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]