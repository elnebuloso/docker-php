ARG PHP_VERSION
ARG PHP_IMAGE_TYPE

FROM php:${PHP_VERSION}-${PHP_IMAGE_TYPE}

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "install system" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
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

ADD release/official/all/bin /usr/local/bin
ADD release/official/all/php/extensions /opt/php/extensions
ADD release/official/all/php/docker.ini $PHP_INI_DIR/conf.d

RUN echo "configure php helpers" \
    && find /usr/local/bin -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && find /opt/php/extensions -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x /usr/local/bin/* \
    && chmod +x -R /opt/php/extensions/*

RUN echo "install php extensions" \
    && phpext install opcache \
    && phpext install xdebug

WORKDIR /app/main

ENTRYPOINT ["phpext-entrypoint"]

CMD ["php", "--version"]
