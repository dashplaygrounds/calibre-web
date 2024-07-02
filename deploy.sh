#!/bin/bash
docker pull ghcr.io/linuxserver/calibre:latest
docker pull ghcr.io/linuxserver/calibre-web:latest
docker rmi -f $(docker images -f "dangling=true" -q)
export PUID=1001
export PGID=1001
docker network create ebooks
docker compose up -d

# Setup calibre directory /books/Calibre_Library
# docker cp metadata.db calibre:/books/Calibre_Library
# docker exec calibre bash -c 'chmod a+w /books/Calibre_Library/metadata.db'
watch docker ps -a
