#!/bin/sh

project=/etc/apache2/sites-enabled

echo $project

cd $project

echo $OBPTESTSERVICE_NAME

sed -i 's/obptestserver.pditdap/$OBPTESTSERVICE_NAME/g' server-static.conf
