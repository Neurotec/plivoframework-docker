FROM debian:jessie
LABEL maintainer "Jovany Leandro G.C <dirindesa@neurotec.co>"

ENV TERM dumb

RUN apt-get update && apt-get install -fy python python-pip python-setuptools python-dev libev-dev python-virtualenv
RUN apt-get install -fy redis-server

ADD https://github.com/Neurotec/plivoframework/raw/master/scripts/plivo_install.sh /plivo_install.sh
RUN bash /plivo_install.sh /plivo

COPY docker-entrypoint.d/plivoframework.sh /docker-entrypoint.sh

EXPOSE 8088
EXPOSE 8084

ENTRYPOINT ["/docker-entrypoint.sh"]
