#!/bin/bash
last_two_chars=$(echo $USER | tail -c 3)
declare -i last_two_chars
port=$((10#$last_two_chars+8999))

(sleep .5 && echo -e "\n" | telnet localhost $port) & \
telnet localhost $port
