# Pull base image.
FROM dockerfile/java:oracle-java7

MAINTAINER Robert Bjarnason <robert@citizens.is>

RUN echo 'version 0.4'

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install supervisor

ADD locale /etc/default/locale
ADD supervisord.conf /etc/supervisor/supervisord.conf

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Command to run
CMD ["/usr/bin/supervisord"]
