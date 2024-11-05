#!/bin/bash

WLAN=wlan0

BAND="5G"
#BAND="2G"

CHANNEL2G="6"
CHANNEL5G="149"

nmcli device set "$WLAN" managed no
ip link set "$WLAN" down
iw dev "$WLAN" set monitor otherbss
iw reg set BO
ip link set "$WLAN" up
iw dev "$WLAN" set txpower fixed -2700

case $BAND in
  "5G")
      echo "Setting $WLAN to channel $CHANNEL5G"
      iw dev "$WLAN" set channel $CHANNEL5G HT20
      ;;
  "2G")
      echo "Setting $WLAN to channel $CHANNEL2G"
      iw dev "$WLAN" set channel $CHANNEL2G HT20
      ;;
   *)
      echo "Select 2G or 5G band"
      exit -1;
      ;;
esac

# Video TX
<<<<<<< HEAD
./wfb_tx -f 'data' -p 0 -u 5600 -K air/drone.key -B 20 -G "long" -S 1 -L 1 -M 1 -k 8 -n 12 -T 0 -F 0 -C 0 -R 2097152 "$WLAN"
=======
~/wfb-ng-minimal/wfb_tx -p 0 -u 5600 -K ~/wfb-ng-minimal/air/drone.key "$WLAN"
>>>>>>> d0a386711ff1cd52631ddbe2f2c18327aafb8f61
