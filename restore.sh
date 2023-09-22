# cat ~/q4-2023-calibrebackups/timestamp.txt
# copy file path to backup directory
DBFILE=/home/kubeadmin/q4-2023-calibrebackups/calibrebackup_09222023_150154/calibre-metadata.db
docker cp $DBFILE calibre:/books/Calibre_Library/metadata.db
# Then on calibre GUI > Calibre_Library > Library Maintenance >  Restore database
