## Deploy Ingress + CertManager
An Ingress resource will be deployed to expose any web app. This Ingress will be secured with Cert-Manager, another Kubernetes resource that will allow us to manage and provide TLS (Let's Encrypt) certificates, in order to encrypt HTTP traffic in Ingress.

###Requirements
- RBAC enabled on the cluster.
- A domain.

###Step 1: Configure the Nginx Ingress driver.
Install the resources required by the Nginx Ingress driver.
~~~
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
~~~


~~~
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml
~~~
###Step 2: Create Ingress resource

