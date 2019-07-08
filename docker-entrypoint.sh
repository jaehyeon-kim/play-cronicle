#!/bin/bash

set -e

if [ "$IS_MASTER" = "0" ]
then
  echo "Running SLAVE server"
else 
  echo "Running MASTER server"
  /opt/cronicle/bin/control.sh setup
fi

/opt/cronicle/bin/control.sh start

while true; 
do 
  sleep 30; 
  /opt/cronicle/bin/control.sh status
done