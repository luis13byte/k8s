## How-to safely Drain a Node

1. First we check which pods are running on the node we want to drain, for maintenance, upgrade or simply removal of that node from the cluster.
~~~
kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --namespace default
~~~

2. Then we must check the `PodDisruptionBudget` assigned to those pods we are interested in, the ones that are in the node to be removed. If they do not exist we must create them.
~~~
kubectl get PodDisruptionBudget -n default
~~~

3. We run `kubectl drain <node>` to safely evict all of your pods from a node.

4. At this point we can perform the maintenance task on the node (delete).

5. (optional) When we have finished we must execute `kubectl uncordon <node>`, to re-activate the Scheduling and it can receive pods again.


### References

- https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/
