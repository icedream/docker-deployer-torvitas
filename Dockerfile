FROM composer/composer:1.1-alpine
RUN composer global require --dev deployer/deployer:~4.2.1 deployer/recipes:~4.0.4 codeception/codeception:~2.2.9
RUN apk --no-cache add openssh-client rsync
ENTRYPOINT ["dep"]
