FROM ubuntu:16.04
MAINTAINER jeff.tunessen@gmail.com

ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_VERSION

RUN echo "install system" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        locales \
        curl \
        nano \
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

RUN echo "install php" \
    && add-apt-repository ppa:ondrej/php \
    && add-apt-repository ppa:ondrej/pkg-gearman \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-imagick \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-memcached \
        php${PHP_VERSION}-mongodb \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-sqlite3 \
        php${PHP_VERSION}-ssh \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-yaml \
        php${PHP_VERSION}-zip \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

RUN echo "install apache" \
    && add-apt-repository ppa:ondrej/apache2 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        libapache2-modsecurity \
        php${PHP_VERSION} \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

ADD docker/apache/bin /usr/local/bin
ADD docker/apache/conf-available /etc/apache2/conf-available
ADD docker/apache/sites-available /etc/apache2/sites-available
ADD docker/php/docker.ini /etc/php/${PHP_VERSION}/mods-available/docker.ini

RUN echo "configure" \
    && chmod +x /usr/local/bin/* \
    && chmod 0644 /etc/apache2/conf-available/* \
    && chmod 0644 /etc/apache2/sites-available/* \
    && chmod 0644 /etc/php/${PHP_VERSION}/mods-available/* \
    && a2enmod headers \
    && a2enmod rewrite \
    && a2enconf security \
    && a2enconf servername \
    && a2enconf expose-env \
    && a2enconf log-formats \
    && phpenmod docker \
    && ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log \
    && rm -rf /var/www/*

ENV APP_ENV dev

EXPOSE 80
WORKDIR /var/www
ENTRYPOINT ["docker-entrypoint"]
CMD ["apache2-foreground"]
