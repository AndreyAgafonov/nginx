#!/bin/bash
time=$(date +%s)
vagrant status | awk 'BEGIN{ tog=0; } /^$/{ tog=!tog; } /./ { if(tog){print $1} }' | xargs -P5 -I {} vagrant up {} --no-provision
vagrant provision
#vagrant up
echo "---"
echo $(($(date +%s)-$time))