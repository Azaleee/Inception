FROM debian:bullseye

COPY ./tools/wordpress_init.sh ./wordpress_init.sh

RUN apt update && apt upgrade -y && \
	apt -y install \
	wget \
	curl \
	netcat \
	php \
	php-mysql \
	php-fpm \
	php-cli \
	mariadb-client

RUN mkdir -p /run/php && \
	chown -R www-data:www-data /run/php && \
	mkdir -p /var/www/html


RUN wget https://wordpress.org/latest.tar.gz -P /var/www/ && \
	tar xvf /var/www/latest.tar.gz -C /var/www/html --strip-components=1 && \
	rm -rf /var/www/latest.tar.gz && \
	chown -R www-data:www-data /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

RUN ln -sf /dev/stdout /var/log/php7.4-fpm.log

WORKDIR /var/www/html

ENTRYPOINT [ "sh", "/wordpress_init.sh" ]

CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
