#!/bin/bash -e

DB_VENDOR=$1

cd /app/keycloak-6.0.1

bin/jboss-cli.sh --file=/app/tools/cli/databases/$DB_VENDOR/standalone-configuration.cli
rm -rf /app/keycloak-6.0.1/standalone/configuration/standalone_xml_history

bin/jboss-cli.sh --file=/app/tools/cli/databases/$DB_VENDOR/standalone-ha-configuration.cli
rm -rf standalone/configuration/standalone_xml_history/current/*
