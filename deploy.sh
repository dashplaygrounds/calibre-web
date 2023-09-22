#!/bin/bash
docker pull ghcr.io/linuxserver/calibre:latest
docker pull ghcr.io/linuxserver/calibre-web:latest
export PUID=1001
export PGID=1001
docker network create ebooks
docker compose up -d
# Download metadata.db from here
# And link to /data/books volume mapping
docker cp metadata.db calibre:/books/Calibre_Library
# docker cp metadata.db calibre-web:/books
docker exec calibre bash -c 'chmod a+w /books/Calibre_Library'
# docker exec calibre-web bash -c 'chmod a+w /books'
watch docker ps -a
