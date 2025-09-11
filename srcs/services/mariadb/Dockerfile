FROM debian:11

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/init_db.sh /usr/local/bin/init_db.sh

RUN chmod +x /usr/local/bin/init_db.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf 

ENTRYPOINT ["/usr/local/bin/init_db.sh"]
