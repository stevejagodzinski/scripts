#!/bin/sh

networksetup -switchtolocation Home
echo "Switched to Home location."

while true
do
  isProxyEnabled=`networksetup -getautoproxyurl "Wi-Fi" | tail -c -3`
  if [ "$isProxyEnabled" != "No" ]; then
    networksetup -setautoproxystate "Wi-Fi" off
    echo "Turned off proxy on 'Wi-Fi' adapter."
  fi
  sleep 30
done
