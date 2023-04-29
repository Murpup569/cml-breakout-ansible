#!/bin/bash
for i in {01..20}; do
    port=$((10#$i+8999))
    (sleep .5 && echo -e "end" | telnet localhost $port)
done
