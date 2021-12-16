## Notes related to user configuration ops
Get Master CA of the cluster.
~~~
kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' --raw | base64 --decode
~~~

Switch to specific user context, using configuration file.
~~~
kubectl config use-context developer-context --kubeconfig=.kube/config
~~~

Decrypt and read the certificate.
~~~
openssl x509 -text -noout -in ca-master.crt
~~~
