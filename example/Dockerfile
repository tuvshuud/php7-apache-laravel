FROM tuvshuud/php7-apache-laravel:latest

ADD ./ /tmp/docker/

RUN cp /tmp/docker/composer.json /var/www/html/composer.json \
    && cp -r /tmp/docker/app/Library /var/www/html/app/Library \
    && composer update -d /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
