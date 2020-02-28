#!/bin/sh

networksetup -switchtolocation Home
echo "Switched to Home location."

while true
do
  networksetup -setautoproxystate "Wi-Fi" off
  echo "Turned off proxy on 'Wi-Fi' adapter."
  sleep 10
done
