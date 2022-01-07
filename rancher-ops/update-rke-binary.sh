#!/bin/bash

# Upgrade rke binary to latest version
echo "Current version:"
rke --version

curl -sL https://github.com/rancher/rke/releases/latest  \
         | grep ".*rke_linux-amd64.*"  \
         | grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]'   | echo "https://github.com$(sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i')" \
         | wget -qi - && \
         mv rke_linux-amd64 rke && \
         chmod +x rke

mv rke /usr/local/bin
echo "\nNew Version:"
rke --version
