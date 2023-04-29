#!/bin/bash

# Start SSH server
sudo /usr/sbin/sshd -D &

# Start another program here
sudo /breakout-linux-amd64 ui
