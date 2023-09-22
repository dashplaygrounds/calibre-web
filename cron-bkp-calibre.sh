#!/bin/bash
BKPDIR=q4-2023-calibrebackups
PREFIX=calibrebackup
WINBKPDIR=C:/Users/sfeadmin/OneDrive/DATA-CABINET-Q4-2023/2023-Q4-CALIBRE-Backups/
cd ~/${BKPDIR}
ls -lrt
export TIMESTAMP=$(date +%m%d%Y_%H%M%S)
# env vars
export WHOST="192.168.1.176"
export WPORT="22"
export OUTDIR=${PREFIX}_${TIMESTAMP}
export FILE=${OUTDIR}.zip

# Inside .162
mkdir ${OUTDIR}; cd ${OUTDIR}
docker cp calibre:/books/Calibre_Library/metadata.db calibre-metadata.db
docker cp calibre-web:/books/Calibre_Library/metadata.db calibre-web-metadata.db
# rsync -av --progress --exclude '.caltrash' /data/books/CalibreLibrary ./CalibreLibrary

cd ..
du -sh ${OUTDIR}

ls -lrt

sleep 5s
# Zipping dump directory
if [ ! -d "${OUTDIR}" ]; then
  echo "${OUTDIR} does not exist."
else
  echo $(pwd)/$FILE >timestamp.txt
  cat timestamp.txt
  zip -r ${FILE} ./${OUTDIR}
fi


# Wait for the crond service to trigger on specified times - every 12 hours
# crontab -e
# Remember to 'ssh-pass' to windows sfeadmin@192.168.1.176
# Sync is thru scp to Onedrive Win10 on Proxmox LAN
sshpass -p "789456" \
    scp -P $WPORT ${FILE} \
 sfeadmin@$WHOST:${WINBKPDIR}
# scp is successful
# But require manual RDP to sign-in to onedrive .190
# and upload the new backup automatically
# Notice the correct double quotes
echo "Last ${PREFIX}: $FILEPATH/$FILE \n" >>~/${BKPDIR}/backup-timelogs.txt
