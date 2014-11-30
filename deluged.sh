#!/bin/bash

exec /sbin/setuser deluge deluged -d -c /config -L info -l /log/deluged.log
