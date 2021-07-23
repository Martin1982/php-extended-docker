FROM php:7.4-fpm-alpine

RUN apk add autoconf
RUN apk add gcc
RUN apk add g++
RUN apk add make
RUN apk add composer
RUN apk add libzip-dev
RUN apk add libpng-dev
ADD usr/local/etc/php/conf.d/memory.ini /usr/local/etc/php/conf.d/memory.ini
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
