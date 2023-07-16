#!/bin/bash
docker network create ebooks
docker compose up -d
sleep 10
# Download metadata.db from here
# And copy to /books volume mapping
docker cp metadata.db calibre-web:/Calibre_Library
docker exec calibre-web bash -c 'chmod a+w /Calibre_Library'
