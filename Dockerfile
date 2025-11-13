FROM php:7.2.2-apache

# 1. Beharrezko PHP luzapenak instalatu
RUN docker-php-ext-install mysqli

# 2. Moduluak gaitu:
#    'rewrite' -> .htaccess-ko URL politetarako
#    'headers' -> .htaccess-ko segurtasun-goiburuetarako (CSP, X-Frame, etab.)
RUN a2enmod rewrite
RUN a2enmod headers

# 3. Aplikazioaren kodea kopiatu
COPY ./app /var/www/html/

# 4. SEGURTASUN KONPONKETAK (HONEK BAI FUNTZIONATZEN DU)
#    Apache-ren bertsioa ezkutatu
RUN sed -i 's/^ServerTokens .*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
RUN sed -i 's/^ServerSignature .*/ServerSignature Off/' /etc/apache2/conf-available/security.conf
RUN sed -i '/<Directory \/var\/www\/html>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/sites-available/000-default.conf
#    PHP-ren "X-Powered-By" goiburua ezkutatu
RUN echo "expose_php = Off" > /usr/local/etc/php/conf.d/zz-security.ini
