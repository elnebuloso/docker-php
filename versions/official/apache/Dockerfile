ARG PHP_VERSION

FROM php:${PHP_VERSION}

ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_VERSION

RUN echo "install system" \
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

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV APP_ENV dev

ADD docker/php/docker.ini $PHP_INI_DIR/conf.d/

WORKDIR /var/www

ADD docker/apache/conf-available /etc/apache2/conf-available
ADD docker/apache/sites-available /etc/apache2/sites-available

RUN echo "configure" \
    && chmod 0644 /etc/apache2/conf-available/* \
    && chmod 0644 /etc/apache2/sites-available/* \
    && a2enmod headers \
    && a2enmod rewrite \
    && a2enconf security \
    && a2enconf servername \
    && a2enconf expose-env \
    && a2enconf log-formats \
    && rm -rf /var/www/*

ADD docker/bin /usr/local/bin
ADD docker/php/extensions /opt/php/extensions

RUN echo "configure php helpers" \
    && find /usr/local/bin -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && find /opt/php/extensions -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x /usr/local/bin/* \
    && chmod +x /opt/php/extensions/*

RUN phpext install opcache
RUN phpext install xdebug
RUN phpext install memcached

ENTRYPOINT ["phpext-entrypoint"]
CMD ["apache2-foreground"]
