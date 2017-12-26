FROM ubuntu:16.04
MAINTAINER jeff.tunessen@gmail.com

RUN echo "install system essentials" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        ca-certificates locales \
        curl \
        less \
        nano \
    && locale-gen en_US \
    && locale-gen en_US.UTF-8 \
    && locale-gen de_DE \
    && locale-gen de_DE.UTF-8 \
    && echo 'alias l="ls -alhF"' > /root/.bash_aliases \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/tmp/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/locale/* \
    && rm -rf /tmp/*

# set system-wide locale settings
ENV LC_ALL en_US.UTF-8

RUN echo "add package repositories" \
    && add-apt-repository ppa:ondrej/php \
    && add-apt-repository ppa:ondrej/pkg-gearman

RUN echo "install php" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        libapache2-modsecurity \
        php5.6 \
        php5.6-cli \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/tmp/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/locale/* \
    && rm -rf /tmp/*

ADD bin/ /usr/local/bin
ADD conf/apache2/conf-available /etc/apache2/conf-available
ADD conf/apache2/sites-available /etc/apache2/sites-available

RUN echo "permissions" \
    && chmod +x /usr/local/bin/* \
    && chmod 0644 /etc/apache2/conf-available/* \
    && chmod 0644 /etc/apache2/sites-available/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN echo "configure apache" \
    && a2enmod headers \
    && a2enmod rewrite \
    && a2enconf security \
    && a2enconf servername \
    && ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log \
    && usermod -u 1000 $APACHE_RUN_USER \
    && groupmod -g 1000 $APACHE_RUN_GROUP

EXPOSE 80

CMD ["container-run"]