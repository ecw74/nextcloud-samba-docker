FROM nextcloud:fpm-alpine

LABEL maintainer=hxxnrx@gmx.de \
    org.label-schema.name="Nextcloud Container" \
    org.label-schema.description="Nextcloud Container." \
    org.label-schema.url="https://nextcloud.com/" \
    org.label-schema.vcs-url="https://github.com/ecw74/nextcloud-facerec-docker" \
    org.label-schema.version=$VCS_REF \
    org.label-schema.schema-version="1.0"


# install php smbclient
RUN apk add $PHPIZE_DEPS libsmbclient samba-dev
RUN pecl install smbclient && \
    docker-php-ext-enable smbclient

# install imagemagick
RUN apk add $PHPIZE_DEPS imagemagick imagemagick-dev

RUN apk add $PHPIZE_DEPS libtool pcre-dev && \
    pecl install imagick && \
    docker-php-ext-enable imagick

# cleanup
RUN apk del $PHPIZE_DEPS libtool pcre-dev
