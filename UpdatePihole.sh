pkill python3
cd /tmp/PiHole/outfiles
python3 -m http.server 8080 --bind 192.168.1.125 &
#pihole -up
sudo apt update
sudo apt-get dist-upgrade -y
/tmp/PiHole/PiholeAggAdlistUpdate.sh
sudo pihole -g
rm /tmp/PiHole/outfiles/outfile
pkill python3
