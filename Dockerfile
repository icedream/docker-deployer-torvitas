FROM torvitas/php-fpm:7
MAINTAINER "Sascha Marcel Schmidt" <docker@saschaschmidt.net>
RUN apt-get update && apt-get install rsync openssh-client unzip -y && rm -r /var/lib/apt/lists/*
RUN composer global remove codeception/codeception && \
    composer global update && \
    composer global require --dev deployer/deployer:~4.2.1 deployer/recipes:~4.0.4

# Apply patches
COPY patches /patches
RUN apt-get update && apt-get install -y patch && rm -r /var/lib/apt/lists/* && \
    cd /usr/local/lib/composer/vendor/deployer/deployer && \
    find /patches -name '*.patch' -exec patch -p1 -i {} \; && \
    rm -rf /patches

COPY src/ /usr/local/
CMD ["dep"]
