#!/bin/bash

#cron job to do this daily

mkdir /tmp/PiHole

#curl download all the individual lists
	curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts --output opt/pihole/update/outfiles/StevenBlackHosts.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt --output opt/pihole/update/outfiles/simple_tracking.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt --output opt/pihole/update/outfiles/simple_ad.txt
	curl https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt --output opt/pihole/update/outfiles/ads-and-tracking-extended.txt
	curl https://v.firebog.net/hosts/static/w3kbl.txt --output opt/pihole/update/outfiles/w3kbl.txt
	curl https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt --output  opt/pihole/update/outfiles/AntiMalwareHosts.txt
	curl https://v.firebog.net/hosts/RPiList-Malware.txt --output opt/pihole/update/outfiles/RPiList-Malware.txt
	curl https:v.firebog.net/hosts/RPiList-Phishing.txt --output opt/pihole/update/outfiles/RPiList-Phishing.txt
	curl https:v.firebog.net/hosts/Admiral.txt --output opt/pihole/update/outfiles/Admiral.txt
	curl https://v.firebog.net/hosts/Prigent-Malware.txt --output opt/pihole/update/outfiles/Prigent-Malware.txt
	curl https:raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.plus.txt --output opt/pihole/update/outfiles/hagezi-pro.plus.txt
	curl https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/tif.txt --output opt/pihole/update/outfiles/hagezi-tif.txt
	curl https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.tiktok.txt  --output opt/pihole/update/outfiles/hagezi-tiktok.txt

#combine lists, remove dupes and blank lines, remove all comment lines, split into single 1-billion line file(s)
	cat /tmp/PiHole/outfiles/*.txt | grep -v '^\s*$' | sort -u | sed '/^#/d' | split -l1000000000 - opt/pihole/update/outfiles/outfile_

#clean up source text files
	rm opt/pihole/update/outfiles/*.txt

#Log last run time
	touch /home/gmr2048/Documents/PiHole/LastRunTime
