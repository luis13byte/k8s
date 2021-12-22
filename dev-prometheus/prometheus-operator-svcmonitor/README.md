## Simple deployment to test serviceMonitor
This deployment uses a test application that sends metrics, the objective is to create a serviceMonitor and that this creates the corresponding configuration to import it to Prometheus.

### Requirements
- To have deployed the kube-prometheus project.
- Simple understanding Prometheus Operator.
