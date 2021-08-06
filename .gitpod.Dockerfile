FROM gitpod/workspace-mysql

USER root

RUN add-apt-repository ppa:ondrej/php && \
    install-packages php8.0 && \
    update-alternatives --set php /usr/bin/php8.0
    apt-get clean -y && \
    curl -o /usr/bin/composer https://getcomposer.org/composer.phar && \
    chmod +x /usr/bin/composer && \
    composer selfupdate && \
    rm -rf /root/.composer && \
    composer global require drush/drush-launcher && \
    echo 'export PATH="$PATH:~/.config/composer/vendor/bin"' >> ~/.bashrc
    
USER gitpod
