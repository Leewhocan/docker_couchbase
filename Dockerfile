FROM couchbase/server:7.0.0

ENV COUCHBASE_USERNAME=admin
ENV COUCHBASE_PASSWORD=password

COPY configure-node.sh /opt/couchbase

RUN chmod +x /opt/couchbase/configure-node.sh

CMD ["/opt/couchbase/configure-node.sh"]