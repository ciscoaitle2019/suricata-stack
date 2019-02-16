#!/bin/bash

sed -i "s/eth0/${INTERFACE}/g" /etc/suricata/suricata.yaml

#top -b

/usr/bin/suricata -c /etc/suricata/suricata.yaml -i $INTERFACE --set capture.disable-offloading=false
