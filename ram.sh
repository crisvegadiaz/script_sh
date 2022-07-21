#!/bin/bash
# memoria ram.
sudo echo "echo 1 > /proc/sys/vm/drop_caches"
# memoria swap
sudo swapoff -a
sudo swapon -a
free -h


