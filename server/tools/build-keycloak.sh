#!/bin/sh
#####################
# Create DB modules #
#####################

echo $JDBC_MARIADB_VERSION

mkdir -p /app/keycloak-6.0.1/modules/system/layers/base/org/mariadb/jdbc/main
cd /app/keycloak-6.0.1/modules/system/layers/base/org/mariadb/jdbc/main
curl -L https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/$JDBC_MARIADB_VERSION/mariadb-java-client-$JDBC_MARIADB_VERSION.jar > mariadb-jdbc.jar
cp /app/tools/databases/mariadb/module.xml .

###################
# Set permissions #
###################
echo $KEYCLOAK_USER

chmod -R g+rw /app/keycloak-6.0.1
