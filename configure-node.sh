#!/bin/bash

# Wait for Couchbase server to be ready
until curl -sSf http://127.0.0.1:8091; do
    sleep 1
done

# Set up Couchbase server using the Couchbase CLI
/opt/couchbase/bin/couchbase-cli cluster-init \
    --cluster-username=$COUCHBASE_USERNAME \
    --cluster-password=$COUCHBASE_PASSWORD \
    --services=data,index,query \
    --cluster-ramsize=512 \
    --cluster-index-ramsize=256 \
    --index-storage-setting=default

# Start Couchbase server in the background
/opt/couchbase/bin/couchbase-server &

# Keep the container running
tail -f /dev/null