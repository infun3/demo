FROM debian:buster
RUN apt-get update && apt-get install -y wget gnupg2 libzip4 apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y php8.0-intl php8.0-gd git curl \
    php8.0-cli php8.0-curl php8.0-pgsql php8.0-ldap \
    php8.0-sqlite php8.0-mysql php8.0-zip php8.0-xml \
    php8.0-mbstring make && \
    apt-get remove composer -y && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    ln -s /etc/php/8.0/mods-available/php.ini /etc/php/8.0/cli/conf.d/40-php.ini && \
    curl -o /usr/bin/composer https://getcomposer.org/composer.phar && \
    chmod +x /usr/bin/composer && \
    composer selfupdate && \
    rm -rf /root/.composer && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
