## Adding a Service Account Authentication Token to a Kubeconfig File

Obtain the name of the secret of the service account:
~~~
TOKENNAME=$(kubectl -n default get serviceaccount/developer-sa -o jsonpath='{.secrets[0].name}')
~~~

Obtain the value of the service account authentication token:
~~~
TOKEN=$(kubectl -n default get secret ${TOKENNAME} -o jsonpath='{.data.token}'| base64 --decode)
~~~

Add the service account (and its authentication token) as a new user definition in the kubeconfig file by entering the following kubectl command:
~~~
kubectl config set-credentials developer-sa --token=${TOKEN}
~~~

(Optional) Test the service account permissions:
~~~
kubectl config set-context --current --user=developer-sa
~~~

### Check service account permissions
With this command we can check what the serviceaccount can and cannot do.
~~~
kubectl auth can-i get pods -n live --as developer-sa
~~~

### Disable access to Service Account
In the future if you want to remove access to the service account cluster, remove the Kubernetes secret containing the authentication token.
~~~
kubectl -n kube-system delete secret $TOKENNAME
~~~
