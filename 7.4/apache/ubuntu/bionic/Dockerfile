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

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV APP_ENV dev
ENV PHP_VERSION 7.4

RUN echo "install php" \
    && add-apt-repository ppa:ondrej/php \
    && add-apt-repository ppa:ondrej/apache2 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        php7.4 \
        php7.4-cli \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

COPY php/all/php/phpext.sh /usr/local/bin/phpext
COPY php/all/php/docker.ini /etc/php/7.4/mods-available
COPY php/all/apache/conf-available /etc/apache2/conf-available
COPY php/all/apache/sites-available /etc/apache2/sites-available
COPY php/ubuntu/apache/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
COPY php/ubuntu/apache/apache-foreground.sh /usr/local/bin/apache-foreground

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
    && chmod +x /usr/local/bin/*

WORKDIR /app/main

ENTRYPOINT ["docker-entrypoint"]

CMD ["apache-foreground"]

EXPOSE 80
