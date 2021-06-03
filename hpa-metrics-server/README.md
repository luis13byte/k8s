# HPA deployment con Metrics Server

El siguiente proyecto especifica la configuración para hacer un deployment autoescalable con HPA, donde un servidor Nginx funciona como servidor web. Las metricas de pods que utlizara el HPA serán enviadas por Metrics Server.

Metrics Server permitirá al cluster monitorizar los pods por su uso de memoria y CPU. La configuración de HPA usará estos valores para aumentar o disminuir el numero de pods de un deployment.

## Metrics Server
### Requisitos Metrics Server
Metrics Server requiere de requisitos específicos para la configuración del clúster y de la red. Estos requisitos no son los predeterminados para todas las distribuciones de clúster. Por favor, asegúrese de que su clúster Kubernetes cumple estos requisitos antes de utilizar Metrics Server. Use el siguiente enlace: https://github.com/kubernetes-sigs/metrics-server#requirements

### Instalación Metrics Server
Con el siguiente comando instalamos la última versión de Metrics Server. Antes comprobar la compatiblidad con la versión de Kubernetes.
~~~
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
~~~

Podemos comprobar la instalación correcta ejecutando el comando `kubectl get deployment metrics-server -n kube-system` esto mostrará el estado deployment en el namespace "kube-system" que contiene todos los componentes del Metrics Server.


Después de haber instalado Metrics Server en el cluster se podra consultar el uso de memoria de los pods, usando el comando `kubectl top pods` podemos ordenar todos los pods por el uso de memoria y CPU, de menor a mayor.
