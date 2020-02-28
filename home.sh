#!/bin/sh

NETWORK_ADAPTER="Wi-Fi"
HOME_LOCATION="Home"
REFRESH_RATE_SECONDS=30

echo "Looking for network adapter named: $NETWORK_ADAPTER"

echo "Switching to '$HOME_LOCATION' location"
networksetup -switchtolocation $HOME_LOCATION
echo "\nSwitched to '$HOME_LOCATION' location"

echo "Turning proxy off on '$NETWORK_ADAPTER' adapter."
echo "Refreshing every $REFRESH_RATE_SECONDS seconds..."

while true
do
  echo "enhance..."
  isProxyEnabled=`networksetup -getautoproxyurl "$NETWORK_ADAPTER" | tail -c -3`
  if [ "$isProxyEnabled" != "No" ]; then
    networksetup -setautoproxystate "Wi-Fi" off
    echo "Turned off proxy on '$NETWORK_ADAPTER' adapter"
  fi
  sleep $REFRESH_RATE_SECONDS
done
