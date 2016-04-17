FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get install curl libfontconfig ca-certificates

RUN curl -s https://packagecloud.io/install/repositories/pithings/rpi/script.deb.sh | bash

RUN mkdir -p /var/lib/grafana
RUN mkdir -p /var/log/grafana

RUN apt-get install grafana

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 3000

VOLUME ["/etc/grafana","/var/log/grafana","/var/lib/grafana"]

WORKDIR /usr/share/grafana
CMD ["/usr/sbin/grafana-server","-config","/etc/grafana/grafana.ini","cfg:default.paths.logs=/var/log/grafana","cfg:default.paths.data=/var/lib/grafana"]
