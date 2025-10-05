pkill python3
cd /opt/pihole/update/outfiles
python3 -m http.server 8080 --bind 192.168.1.125 &
#pihole -up
sudo apt update
sudo apt-get dist-upgrade -y
/opt/pihole/update/PiholeAggAdlistUpdate.sh
sudo pihole -g
rm /opt/pihole/update/outfiles/outfile*
pkill python3
