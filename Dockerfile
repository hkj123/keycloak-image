FROM reg.qloudhub.com/qloudservice/qloudbase:1.0.1

RUN apt-get update

ENV KEYCLOAK_VERSION 6.0.1
ENV JDBC_MARIADB_VERSION 2.2.3
ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD admin
ENV KEYCLOAK_IMPORT /app/tools/realm/realm-openbanking-with-algo-rs256.json
ENV DB_USER root
ENV DB_PASSWORD root123
ENV DB_ADDR 172.17.0.2
ENV DB_PORT 3306
RUN curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz | tar zx

COPY server/tools/ /app/tools/
COPY server/themes/ /app/keycloak-6.0.1/themes/
RUN chmod u+x /app/tools/build-keycloak.sh
RUN chmod u+x /app/tools/docker-entrypoint.sh
RUN chmod u+x /app/tools/databases/change-database.sh
RUN chmod u+x /app/tools/interfaces/change-interface.sh
RUN chmod u+x /app/tools/realm/realm-openbanking-with-algo-rs256.json

RUN /app/tools/build-keycloak.sh

ENTRYPOINT [ "/app/tools/docker-entrypoint.sh" ]
