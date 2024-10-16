FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

COPY conf /etc/mysql/mariadb.conf.d/50-server.cnf
 
COPY ./tools/mariadb.sh .
RUN chmod +x mariadb.sh

EXPOSE 3306

ENTRYPOINT ["./mariadb.sh"]
