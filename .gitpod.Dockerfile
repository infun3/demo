FROM gitpod/workspace-mysql

USER root

RUN add-apt-repository ppa:ondrej/php && \
    install-packages php8.0 && \
    update-alternatives --set php /usr/bin/php8.0
    sudo apt-get clean -y && \
    sudo curl -o /usr/bin/composer https://getcomposer.org/composer.phar && \
    sudo chmod +x /usr/bin/composer && \
    sudo composer selfupdate && \
    sudo rm -rf /root/.composer && \
    composer global require drush/drush-launcher && \
    echo 'export PATH="$PATH:~/.config/composer/vendor/bin"' >> ~/.bashrc
    
USER gitpod
