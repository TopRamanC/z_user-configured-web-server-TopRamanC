FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y apache2 && apt-get clean

RUN a2enmod userdir
RUN useradd username

COPY index.html .
RUN /etc/init.d/apache2 start

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]