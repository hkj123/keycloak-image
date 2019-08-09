#!/bin/bash

##################
# Add admin user #
##################
echo "Add admin user"

if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    /app/keycloak-6.0.1/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

################
# Realm import #
################

echo "Realm import"
if [ "$KEYCLOAK_IMPORT" ]; then
    SYS_PROPS+=" -Dkeycloak.import=$KEYCLOAK_IMPORT"
fi

############
# DB setup #
############

echo "DB setup"
export DB_VENDOR="mariadb"

echo ${DB_VENDOR}

# Set DB name
DB_NAME="MariaDB"
export DB_NAME="MariaDB"

# Configure DB

echo "========================================================================="
echo ""
echo "  Using $DB_NAME database"
echo ""
echo "========================================================================="
echo ""

/bin/sh /app/tools/databases/change-database.sh $DB_VENDOR
/bin/sh /app/tools/interfaces/change-interface.sh

##################
# Start Keycloak #
##################
echo "Start Keycloak"
exec /app/keycloak-6.0.1/bin/standalone.sh $SYS_PROPS
exit $?
