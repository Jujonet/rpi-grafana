#!/bin/bash

echo "Sourcing defaults"
source /etc/default/grafana-server
echo "$GRAFANA_HOME"
/usr/sbin/grafana-server "$@"
