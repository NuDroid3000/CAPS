# NetworkManager script
SSID=SSID_HERE
PASSWORD=PASSWORD_HERE

echo Setting up WiFi.
nmcli device wifi list
nmcli device wifi connect $SSID password $PASSWORD
echo WiFi setup, run sh install-part2.sh
