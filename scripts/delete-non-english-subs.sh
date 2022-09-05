#!/bin/bash
find /mnt/user/data/media -regextype posix-extended ! -regex ".*\.(en|eng)((\.cc|.sdh|.hi|\.forced)|)\.srt\$" | egrep "\.srt" | sed 's/^/rm -f \"/' | sed 's/$/\"/' >> /mnt/user/data/logs/delete-non-eng-srt.sh
