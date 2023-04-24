FIXING A PLEX DATABASE
https://support.plex.tv/articles/repair-a-corrupted-database/

To make new folder to copy the Plex SQLite file to 
mkdir databasetools

To copy  Plex SQLite from container
cp containername:/usr/lib/plexmediaserver/ destination/folder

To check the database integrity
"Plex SQLite" "/database/location/name.db" "PRAGMA integrity_check"
sudo ./Plex\ SQLite "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-fix" "PRAGMA integrity_check"
sudo ./Plex\ SQLite "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "VACUUM"
sudo ./Plex\ SQLite "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "REINDEX"

Copy database
cp "/database/location/name.db" "/database/location/name.db_old"

To autofix database
"Plex SQLite" "/database/location/" ".output recover.out" ".recover"

To dump the database
"Plex SQLite" "/database/location/" ".output dump.sql" ".dump"

Delete the database just dumped
rm /database/location/name.db

To read the database
"Plex SQLite" "/database/location/" ".read dump.sql"

If these files are present delete them
com.plexapp.plugins.library.db-shm
com.plexapp.plugins.library.db-wal

After creating new database make writable

chmod 777 /databae/location/name.db
