FROM php:7.4-apache-buster as prod

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "install system dependencies" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        locales \
        locales-all \
        curl \
    && locale-gen en_US \
    && locale-gen en_US.UTF-8 \
    && locale-gen de_DE \
    && locale-gen de_DE.UTF-8 \
    && echo 'alias l="ls -alhF"' > /root/.bash_aliases \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

ENV PHP_VERSION 7.4

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV APP_ENV dev

COPY config/all/php/phpext.sh /usr/local/bin/phpext
COPY config/all/php/docker.ini $PHP_INI_DIR/conf.d
COPY config/all/apache/conf-available /etc/apache2/conf-available
COPY config/all/apache/sites-available /etc/apache2/sites-available
COPY config/debian/apache/phpext-entrypoint.sh /usr/local/bin/phpext-entrypoint
COPY config/debian/php/extensions /opt/php/extensions

RUN echo "configure" \
    && chmod 0644 /etc/apache2/conf-available/* \
    && chmod 0644 /etc/apache2/sites-available/* \
    && a2enmod headers \
    && a2enmod rewrite \
    && a2enconf servername \
    && a2enconf expose-env \
    && a2enconf log-formats \
    && rm -rf /var/www/* \
    && chmod +x /usr/local/bin/* \
    && find /opt/php/extensions -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x -R /opt/php/extensions/*

RUN echo "install php extensions" \
    && phpext install opcache

WORKDIR /app/main

ENTRYPOINT ["phpext-entrypoint"]

CMD ["apache2-foreground"]

EXPOSE 80
