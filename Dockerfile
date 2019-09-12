FROM php:5.6-apache

LABEL Author="glzjin <i@zhaoj.in>" Blog="https://www.zhaoj.in"

COPY ./files /tmp/
RUN cp -rf /tmp/html/ /var/www/ && \
    chown -R root:root /var/www/html && \
    chmod -R 755 /var/www/html

CMD sh -c "sed -i "s/flag_here/$FLAG/" /var/www/html/index.php && export FLAG=not_flag && FLAG=not_flag && apache2-foreground"
