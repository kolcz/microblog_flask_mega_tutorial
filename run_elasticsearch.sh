#!/bin/bash

docker run --name elasticsearch -d --rm -p 9200:9200 \
    --memory="2GB" \
    -e discovery.type=single-node -e xpack.security.enabled=false \
    -t docker.elastic.co/elasticsearch/elasticsearch:8.11.1