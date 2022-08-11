#!/bin/bash
rsync -av --exclude={'*.jpg','containerd'} /opt/ /mnt/truenas/backups/docker01/`date +%Y-%m-%d`/opt/
00 21 * * * rsync -av --exclude={'*.jpg','containerd'} /opt/ /mnt/truenas/backups/docker01/`date +%Y-%m-%d`/
00 21 * * * rsync -av --exclude={'*.jpg','containerd'} /home/nick/docker/appdata /mnt/nas/backups/docker02/`date +%Y-%m-%d`/

# 00 */1 * * * rsync -a --delete /source/ /destination/backup/hourly
# 00 17 * * * rsync -a --delete /source/ /destination/backup/daily
# 00 18 * * 5 rsync -a --delete  /source/ /destination/backup/weekly
# 00 19 1 * * rsync -a --delete /source/ /destination/backup/monthly_$(date +%Y%m)
# This performs 4 backups:
#     * an hourly backup
#     * a daily backup every day at 5 PM
#     * a weekly backup every Friday (day 5) at 6PM
#     * a monthly backup on the 1st at 7PM
