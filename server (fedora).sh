#! /bin/bash

dnf update && apt upgrade -y
dnf install vim -y
dnf install neovim -y
dnf install tree -y
dnf install htop -y
dnf install locate -y
dnf install tmux -y
dnf install curl -y
dnf install git -y
dnf install net-tools -y


# Intalacion de Speedtest CLI
## If migrating from prior bintray install instructions please first...
# sudo rm /etc/yum.repos.d/bintray-ookla-rhel.repo
# sudo yum remove speedtest
 
## Other non-official binaries will conflict with Speedtest CLI
# Example how to remove using yum
# rpm -qa | grep speedtest | xargs -I {} sudo yum -y remove {}
 
curl -s https://install.speedtest.net/app/cli/install.rpm.sh | sudo bash
sudo yum install speedtest

