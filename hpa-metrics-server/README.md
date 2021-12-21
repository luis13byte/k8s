# HPA deployment with Metrics Server

The following project specifies the configuration to make an autoscalable deployment with HPA, where a Nginx server works as a web server. The pod metrics used by the HPA will be sent by Metrics Server.

Metrics Server will allow the cluster to monitor the pods for memory and CPU usage. The HPA configuration will use these values to increase or decrease the number of pods in a deployment.

## Metrics Server
### Metrics Server requirements
Metrics Server requires specific requirements for the cluster and network configuration. These requirements are not the default for all cluster distributions. Please make sure that your Kubernetes cluster meets these requirements before using Metrics Server. Use the following link: https://github.com/kubernetes-sigs/metrics-server#requirements

### Metrics Server installation
With the following command we install the latest version of Metrics Server. First check the compatibility with the Kubernetes version.
~~~
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
~~~

We can check the correct installation by running the command `kubectl get deployment metrics-server -n kube-system` this will show the deployment status in the namespace "kube-system" which contains all the Metrics Server components.


After having installed Metrics Server in the cluster you can check the memory usage of the pods, using the `kubectl top pods` command you can sort all the pods by memory and CPU usage, from lowest to highest.
