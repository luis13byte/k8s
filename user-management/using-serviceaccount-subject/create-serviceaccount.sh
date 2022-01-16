#!/bin/bash

USERNAME=$1
NAMESPACE=$2

kubectl create namespace ${NAMESPACE} && \
kubecrl create serviceaccount ${USERNAME} -n ${NAMESPACE} && \
kubectl create clusterrole portforward-ops --verb="get","list","create","port-forward" --resource=pods,pods/forward,rs.extensions,rs.apps && \
kubectl create clusterrolebinding ${USERNAME} --clusterrole=portforward-ops --serviceaccount=${NAMESPACE}:${USERNAME}
