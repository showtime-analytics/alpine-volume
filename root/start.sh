#!/usr/bin/env bash

SERVICE_USER=${SERVICE_USER:-"root"}
SERVICE_UID=${SERVICE_UID:-"0"} 
SERVICE_GROUP=${SERVICE_GROUP:-"root"} 
SERVICE_GID=${SERVICE_GID:-"0"}
SERVICE_VOLUMES=${SERVICE_VOLUMES:-"/opt"}

addgroup -g ${SERVICE_GID} ${SERVICE_GROUP} 
adduser -g "${SERVICE_USER} user" -D -H -G ${SERVICE_GROUP} -s /sbin/nologin -u ${SERVICE_UID} ${SERVICE_USER}

for service_volume in ${SERVICE_VOLUMES//,/ }
do
    echo "Making ${SERVICE_USER}:${SERVICE_GROUP} owner of ${service_volume}"
    chown -R ${SERVICE_USER}:${SERVICE_GROUP} ${service_volume}
done

true
