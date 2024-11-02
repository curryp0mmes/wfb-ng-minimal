![WFB-ng](doc/logo-big.png)

I am trying to use wfb ng to send a simple video stream from a to b.

I specifically want to avoid any uplinks, only downlink, in hopes of maximizing range and minimizing power draw.

For now to make and run do the following steps:

```
make


# For Ground

./scripts/rx_standalone.sh
#there is now a udp stream on port 5600 waiting to be viewed


# For air

./scripts/tx_standalone.sh
#this will send your udp rtp stream on port 5600 to ground

```