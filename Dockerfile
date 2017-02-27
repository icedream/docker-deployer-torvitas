FROM composer/composer:php5-alpine
RUN composer global require --dev deployer/deployer:~4.2.1 deployer/recipes:~4.0.4
RUN apk --no-cache add openssh-client rsync
ENTRYPOINT ["dep"]
