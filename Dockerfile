FROM php:7.2.2-apache

# 1. Behar ditugun PHP luzapenak instalatu
RUN docker-php-ext-install mysqli

# 2. .htaccess fitxategiak funtzionatzeko (URL politak)
RUN a2enmod rewrite
RUN a2enmod headers
# 3. Gure aplikazioaren kodea kopiatu
COPY ./app /var/www/html/
