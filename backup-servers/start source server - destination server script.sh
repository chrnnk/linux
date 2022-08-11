#!/bin/bash
# start source server script -- needs source server script and destination server script to work  
rsync -av --exclude={'*.jpg','dir3','dir4'} sourcedir/ destinationdir/