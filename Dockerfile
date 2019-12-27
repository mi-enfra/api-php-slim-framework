FROM php:7.2-fpm-alpine3.10
LABEL maintainer="Marvin Isaac <misaac@pushnami.com>"
LABEL source="https://gist.github.com/yozik04/400b6bff8a98d1678a80fde6c8e102e9"
ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer