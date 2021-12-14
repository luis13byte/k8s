#!/bin/bash

USER="developer"
CLUSTERCERTS="/etc/kubernetes/ssl"
CLUSTERNAME="local"

mkdir /home/$USER && cd /home/${USER} && groupadd ti
openssl genrsa -out ${USER}.key 2048

openssl req -new -key ${USER}.key \
  -out ${USER}.csr \
  -subj "/CN=${USER}/O=ti}"

# Signing csr with the Master CA and key of the cluster
openssl x509 -req -in ${USER}.csr \
  -CA ${CLUSTERCERTS}/kube-ca.pem \
  -CAkey ${CLUSTERCERTS}/kube-ca-key.pem \
  -CAcreateserial \
  -out ${USER}.crt -days 500

mkdir .certs/ && mv ${USER}.{csr,crt,key} .certs/

kubectl config set-credentials ${USER} \
  --client-certificate=/home/${USER}/.certs/${USER}.crt \
  --client-key=/home/${USER}/.certs/${USER}.key --embed-certs

kubectl config set-context developer-context \
  --cluster=${CLUSTERNAME} --user=${USER}
