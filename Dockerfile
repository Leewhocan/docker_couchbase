FROM couchbase/server:7.0.0

ENV COUCHBASE_USERNAME=admin
ENV COUCHBASE_PASSWORD=password

COPY configure-server.sh /opt/couchbase

RUN chmod +x /opt/couchbase/configure-server.sh

EXPOSE 8091 8092 8093 8094 8095 8096 11207 11210 11211 18091 18092

CMD ["/opt/couchbase/configure-server.sh"]