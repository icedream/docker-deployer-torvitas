FROM composer/composer:1.1-alpine
RUN composer global require --dev deployer/deployer:~4.3.0 deployer/recipes:~4.0.5 codeception/codeception:~2.2.9
RUN apk --no-cache add openssh-client rsync

ENTRYPOINT ["dep"]
