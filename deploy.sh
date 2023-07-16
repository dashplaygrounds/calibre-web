#!/bin/bash
docker network create ebooks
docker compose up -d
sleep 10
# Download metadata.db from here
# And copy to /books volume mapping
docker cp metadata.db calibre-web:/books
docker exec calibre-web bash -c 'chmod a+w /books'
docker exec calibre-web bash -c 'chown -R kasm-user:kasm-user /uploads'
