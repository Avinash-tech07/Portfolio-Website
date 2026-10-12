FROM php:8.2-apache

RUN docker-php-ext-install mysqli \
    && a2enmod rewrite headers

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY docker/start.sh /usr/local/bin/start.sh
RUN sed -i 's/\r$//' /usr/local/bin/start.sh && chmod +x /usr/local/bin/start.sh

WORKDIR /var/www/html
COPY . .

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/usr/local/bin/start.sh"]
