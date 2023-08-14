#!/bin/bash
find /mnt/user/data/ \! -perm 0755 >> /mnt/user/data/logs/non-755-files.log

newperms /mnt/user/data

# processing '/mnt/user/data'
# ... chmod -R u-x,go-rwx,go+u,ugo+X '/mnt/user/data'
# ... chown -R nobody:users '/mnt/user/data'
# ... sync
# completed, elapsed time: 00:01:02
