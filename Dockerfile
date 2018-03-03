FROM aspendigital/octobercms:latest

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

# Expose apache root
VOLUME /var/www/html

# Install xdebug
COPY docker/bin/php-pecl-install /usr/local/bin/
RUN chmod +x /usr/local/bin/php-pecl-install && php-pecl-install xdebug
COPY docker/xdebug.ini /tmp/xdebug.ini
RUN cat /tmp/xdebug.ini >> /usr/local/etc/php/conf.d/docker-php-pecl-xdebug.ini
RUN /sbin/ip route|awk '/default/ { print $3 }' | xargs echo -n >> /usr/local/etc/php/conf.d/docker-php-pecl-xdebug.ini

# Optional artisan commands
# RUN php /var/www/html/artisan plugin:install Rainlab.Builder

# Optional additional package installations
RUN apt-get update && apt-get install -y vim