FROM php:alpine

RUN apk add --no-cache \
    nodejs nodejs-npm \
    git subversion libzip-dev zip \
    # ZLib
    && docker-php-ext-install zip \
    # Composer & phan
    && apk add --no-cache composer && composer global require phan/phan

# Add composer binaries to path
ENV PATH=$PATH:/root/.composer/vendor/bin
