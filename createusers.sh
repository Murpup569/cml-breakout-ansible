#!/bin/bash
for i in {01..20}; do
    adduser --disabled-password --gecos "" device$i && \
    echo "device$i:password" | chpasswd
done
