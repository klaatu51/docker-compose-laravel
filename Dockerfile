FROM php:7.4-fpm

ARG user
ARG uid

RUN docker-php-ext-install pdo pdo_mysql

RUN useradd -G www-data,root -u $uid -d /home/$user $user

WORKDIR /var/www

USER $user