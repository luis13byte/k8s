#!/usr/bin/env bash

USER="developer"
NAMESPACE="live"

sed "s/USER/${USER}/g" role.yaml rolebinding.yaml
sed "s/NAMESPACES/${NAMESPACE}/g" role.yaml rolebinding.yaml
