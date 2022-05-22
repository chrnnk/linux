
find /mnt/user/data/ \! -perm 0755 >> /mnt/user/data/logs/non-755-files.log

#!/bin/bash
newperms /mnt/user/data

# processing '/mnt/user/data'
# ... chmod -R u-x,go-rwx,go+u,ugo+X '/mnt/user/data'
# ... chown -R nobody:users '/mnt/user/data'
# ... sync
# completed, elapsed time: 00:01:02



This utility will restore standard unRaid permissions to all shares and files without touching any of the APPDATA shares for docker applications.

(Many times, a docker application has specific requirements for its ownership / permissions on the files contained within its appdata, and the standard New Permissions tool will change these, possibly rendering the docker application inoperable.)

You should use this tool in case a misconfigured docker application (notably CouchPotato or Sonarr / SickBeard) has written media files to your array with the wrong permissions, and you find yourself unable to modify / delete those files.

This utility starts a background process that goes to each of your data disks and cache disk and changes file and directory ownership to nobody/users (i.e., uid/gid to 99/100), and sets permissions as follows:


For directories:
  drwxrwxrwx

For read/write files:
  -rw-rw-rw-

For readonly files:
  -r--r--r--
    
