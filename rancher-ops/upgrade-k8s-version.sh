#!/bin/bash

DATE=$()

# SECOND STEP
# Take snapshot on all etcd hosts
rke etcd snapshot-save \
  --name snapshot${DATE}.db \
  --config rancher-cluster.yml
  
  
