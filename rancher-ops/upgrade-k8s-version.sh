#!/bin/bash
DATE$(date +'%Y-%m-%d')

# First update cluster.yml with the new kubernetes_version

rke etcd snapshot-save \
  --name snapshot${DATE}.db \
  --config cluster.yml

rke up --config ./cluster.yml
  
