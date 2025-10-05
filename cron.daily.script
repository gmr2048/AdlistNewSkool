pkill python3
cd /home/gmr2048/Documents/PiHole/outfiles
python3 -m http.server 8080 --bind 192.168.1.125 &
#pihole -up
sudo apt update
sudo apt-get dist-upgrade -y
/home/gmr2048/Documents/PiHole/PiholeAggAdlistUpdate.sh
sudo pihole -g
rm /home/gmr2048/Documents/PiHole/outfiles/outfile
pkill python3
