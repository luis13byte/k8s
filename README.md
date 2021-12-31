# k8s

Repository for the development of different little projects, tools, and documentation related to Kubernetes.

## Tips

### 1.Safe application of manifests
Check manifest syntax (tool must be installed).
~~~
kubeval manifest.yaml
~~~

Show differences for resources in yaml file.
~~~
k diff -f manifest.yaml
~~~
https://kubernetes.io/blog/2019/01/14/apiserver-dry-run-and-kubectl-diff/
