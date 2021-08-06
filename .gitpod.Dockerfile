FROM gitpod/workspace-mysql

USER root

RUN add-apt-repository ppa:ondrej/php && \
    install-packages php8.0 && \
    update-alternatives --set php /usr/bin/php8.0

USER gitpod
