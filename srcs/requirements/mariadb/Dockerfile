FROM debian:bullseye

COPY ./tools/config.sh ./config.sh

RUN apt update && apt upgrade -y && apt install mariadb-server -y

RUN mkdir -p /var/lib/mysql /run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /run/mysqld

ENTRYPOINT [ "sh", "./config.sh" ]

CMD [ "mysqld --bind-address=0.0.0.0" ]
