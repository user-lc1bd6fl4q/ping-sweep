#!/bin/bash
for x in $(seq 1 254); do
ping -W 1 -c 1 192.168.$x.1 | grep -E "[0-1].*?:" | cut -d " " -f 4 | tr -d ":" &
done
