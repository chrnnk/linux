#!/bin/bash
backupDate=$(date  +'%F')
echo $backupDate
docker stop

cd ~
tar -czvf docker-backup-$backupDate.tar.gz ~/docker/appdata

docker start

# now go back to home, and copy my backup file to my NAS
cd ~
echo ""
echo "Backup copy is running..."
scp docker-backup-$backupDate.tar.gz /mnt/data/

# remove the tar file from the main home folder after it's copied
rm docker-backup-$backupDate.tar.gz