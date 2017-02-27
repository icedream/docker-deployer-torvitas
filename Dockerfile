FROM torvitas/php-fpm:7
MAINTAINER "Sascha Marcel Schmidt" <docker@saschaschmidt.net>
RUN apt-get update && apt-get install rsync openssh-client unzip -y && rm -r /var/lib/apt/lists/*
RUN composer global remove codeception/codeception && \
    composer global update && \
    composer global require --dev deployer/deployer:~4.2.1 deployer/recipes:~4.0.4
COPY src/ /usr/local/
CMD ["dep"]
