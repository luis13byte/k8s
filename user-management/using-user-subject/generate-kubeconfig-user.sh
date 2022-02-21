#!/bin/bash

USER="developer"
CLUSTERCERTS="/etc/kubernetes/ssl" # Rancher path
CLUSTERNAME="local"

mkdir /root/k8s-ops/user-certs/${USER} ; cd /root/k8s-ops/user-certs/${USER}
openssl genrsa -out ${USER}.key 2048

openssl req -new -key ${USER}.key \
  -out ${USER}.csr \
  -subj "/CN=${USER}/O=IT}"

# Signing csr with the Master CA and key of the cluster
openssl x509 -req -in ${USER}.csr \
  -CA ${CLUSTERCERTS}/kube-ca.pem \
  -CAkey ${CLUSTERCERTS}/kube-ca-key.pem \
  -CAcreateserial \
  -out ${USER}.crt -days 500

kubectl config set-credentials ${USER} \
  --client-certificate=${USER}.crt \
  --client-key=${USER}.key --embed-certs

kubectl config set-context ${USER}-context \
  --cluster=${CLUSTERNAME} --user=${USER}
