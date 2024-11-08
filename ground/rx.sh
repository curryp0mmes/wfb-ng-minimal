#!/bin/bash

WLANS=wlan1
BAND="5G"
#BAND="2G"

CHANNEL2G="6"
CHANNEL5G="149"

for WLAN in $WLANS
do
   nmcli device set "$WLAN" managed no
   ip link set "$WLAN" down
   iw dev "$WLAN" set monitor otherbss
   ip link set "$WLAN" up
#   iw dev "$WLAN" set txpower fixed -3000
  case $BAND in
    "5G")
        echo "Setting $WLAN to channel $CHANNEL5G"
        iw dev "$WLAN" set channel $CHANNEL5G HT40+
        ;;
    "2G")
        echo "Setting $WLAN to channel $CHANNEL2G"
        iw dev "$WLAN" set channel $CHANNEL2G HT40+
        ;;
     *)
        echo "Select 2G or 5G band"
        exit -1;
        ;;
  esac
done

# No UI, video only
~/wfb-ng-minimal/wfb_rx -p 0 -u 5600 -R 2097152 -K /home/pi/wfb-ng-minimal/ground/gs.key $WLANS
