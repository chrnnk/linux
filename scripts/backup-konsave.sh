#!/bin/bash
date_time=$(date +"%Y_%m_%d-%H%M")
/home/nick/.local/bin/konsave -e main -d /mnt/backups/linux/shodan/konsave/ -n $date_time
