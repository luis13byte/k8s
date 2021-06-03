# HPA deployment con Metrics Server

El siguiente proyecto especifica la configuración para hacer un deployment autoescalable con HPA, donde un servidor Nginx funciona como servidor web. Las metricas de pods que utlizara el HPA serán enviadas por Metrics Server.

## Metrics Server
### Requisitos Metrics Server
Metrics Server requiere de requisitos específicos para la configuración del clúster y de la red. Estos requisitos no son los predeterminados para todas las distribuciones de clúster. Por favor, asegúrese de que su clúster Kubernetes cumple estos requisitos antes de utilizar Metrics Server. Use el siguiente enlace: https://github.com/kubernetes-sigs/metrics-server#requirements

### Instalación Metrics Server
Con el siguiente comando instalamos la última versión de Metrics Server. Antes comprobar la compatiblidad con la versión de Kubernetes.
~~~
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
~~~
