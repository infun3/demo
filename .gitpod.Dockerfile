FROM gitpod/workspace-mysql

USER root

RUN add-apt-repository ppa:ondrej/php && \
    install-packages php7.4 && \
    update-alternatives --set php /usr/bin/ph8.0

USER gitpod
