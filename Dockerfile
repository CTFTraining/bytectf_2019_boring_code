FROM php:5.6-apache

LABEL Author="glzjin <i@zhaoj.in>" Blog="https://www.zhaoj.in"

COPY ./files /tmp/
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y zlib1g-dev && \
    cp -rf /tmp/html/ /var/www/ && \
    chown -R root:root /var/www/html && \
    chmod -R 755 /var/www/html && \
    docker-php-ext-install zip && \
    docker-php-ext-enable zip

CMD sh -c "sed -i "s/flag_here/$FLAG/" /var/www/html/index.php && export FLAG=not_flag && FLAG=not_flag && apache2-foreground"
