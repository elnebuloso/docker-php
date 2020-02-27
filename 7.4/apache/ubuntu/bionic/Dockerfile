FROM ubuntu:18.04 as prod

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

RUN echo "install php" \
    && add-apt-repository ppa:ondrej/php \
    && add-apt-repository ppa:ondrej/apache2 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        php7.4 \
        php7.4-cli \
        php7.4-curl \
        php7.4-mbstring \
        php7.4-mysql \
        php7.4-sqlite3 \
        php7.4-xml \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

COPY config/all/php/phpext.sh /usr/local/bin/phpext
COPY config/all/php/docker.ini /etc/php/7.4/mods-available
COPY config/all/apache/conf-available /etc/apache2/conf-available
COPY config/all/apache/sites-available /etc/apache2/sites-available
COPY config/ubuntu/apache/phpext-entrypoint.sh /usr/local/bin/phpext-entrypoint
COPY config/ubuntu/apache/apache-foreground.sh /usr/local/bin/apache-foreground
COPY config/ubuntu/php/extensions /opt/php/extensions

RUN echo "configure" \
    && chmod 0644 /etc/php/7.4/mods-available/* \
    && phpenmod docker \
    && chmod 0644 /etc/apache2/conf-available/* \
    && chmod 0644 /etc/apache2/sites-available/* \
    && a2enmod headers \
    && a2enmod rewrite \
    && a2enconf servername \
    && a2enconf expose-env \
    && a2enconf log-formats \
    && ln -sfT /dev/stderr /var/log/apache2/error.log \
    && ln -sfT /dev/stdout /var/log/apache2/access.log \
    && ln -sfT /dev/stdout /var/log/apache2/other_vhosts_access.log \
    && rm -rf /var/www/* \
    && chmod +x /usr/local/bin/* \
    && find /opt/php/extensions -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x -R /opt/php/extensions/*

WORKDIR /app/main

ENTRYPOINT ["phpext-entrypoint"]

CMD ["apache-foreground"]

EXPOSE 80
