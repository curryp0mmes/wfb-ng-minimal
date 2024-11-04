![WFB-ng](doc/logo-big.png)

I am trying to use wfb ng to send a simple video stream from a to b.

I specifically want to avoid any uplinks, only downlink, in hopes of maximizing range and minimizing power draw.

For now to make and run do the following steps:

```
make


# For Air

./air/libcamera.sh &
./air/tx.sh &
#will stream the raspi camera over port 5602 to wfb_tx which transmits it to a set frequency


# For Ground

./ground/rx.sh
#this will send your udp rtp stream on port 5600 to ground

```