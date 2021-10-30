FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y apache2 && apt-get clean

RUN a2enmod userdir
RUN useradd raman

RUN a2enmod dir

COPY index.html /var/www/html

RUN /etc/init.d/apache2 start

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]