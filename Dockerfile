FROM ubuntu:16.04
MAINTAINER Tuvshinbayar Davaa <tuvshuud@gmail.com>

ENV LC_ALL=C.UTF-8

RUN sed -i s/archive.ubuntu.com/mirror.datacenter.mn/i /etc/apt/sources.list
RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt update

RUN apt install -y php7.2 php7.2-mysql php7.2-mbstring \
    php7.2-soap php7.2-cli php7.2-dev php7.2-ldap php7.2-gd \
    php7.2-zip zip unzip
RUN apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/ /opt/docker/

RUN rm -rf /etc/apache2/sites-enabled/* \
    && rm -rf /etc/apache2/sites-available/* \
    && rm -rf /var/www/html/* \
    && cp /opt/docker/10-docker.conf /etc/apache2/apache2.conf \
    && a2enmod rewrite headers expires

RUN /usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php
RUN /bin/mv composer.phar /usr/local/bin/composer
RUN /usr/local/bin/composer create-project laravel/laravel /var/www/html/ --prefer-dist
RUN /bin/chown www-data:www-data -R /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 2774 /var/www/html/storage \
    && chmod -R 2774 /var/www/html/bootstrap/cache

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
