FROM resin/rpi-raspbian:jessie

ENV GRAFANA_VERSION 3.0.0-beta2

RUN apt-get update && \
    apt-get install libfontconfig

ADD package/grafana_${GRAFANA_VERSION}_armhf.deb /tmp/grafana_${GRAFANA_VERSION}_armhf.dep
RUN mkdir -p /var/lib/grafana
RUN mkdir -p /var/log/grafana
RUN dpkg -i /tmp/grafana_${GRAFANA_VERSION}_armhf.dep && \
  rm /tmp/grafana_${GRAFANA_VERSION}_armhf.dep && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 3000

VOLUME ["/etc/grafana","/var/log/grafana","/var/lib/grafana"]

WORKDIR /usr/share/grafana
CMD ["/usr/sbin/grafana-server","-config","/etc/grafana/grafana.ini","cfg:default.paths.logs=/var/log/grafana","cfg:default.paths.data=/var/lib/grafana"]
