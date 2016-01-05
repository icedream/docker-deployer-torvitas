FROM php:5.6
MAINTAINER "Sascha Marcel Schmidt" <docker@saschaschmidt.net>
RUN apt-get update && apt-get install rsync openssh-client -y && rm -r /var/lib/apt/lists/*
ADD http://deployer.org/deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep
RUN mkdir -p /usr/local/etc/deployer
ADD https://raw.githubusercontent.com/deployphp/recipes/master/recipes/rsync.php /usr/local/etc/deployer/
ADD https://raw.githubusercontent.com/deployphp/deployer/master/recipe/common.php /usr/local/etc/deployer/
WORKDIR "/usr/local/etc/deployer"
CMD ["dep", "deploy"]
