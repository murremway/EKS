# EKS



cd kube-prometheus to deploy prometheus and grafana dashboard

kubectl create -f manifests/setup


kubectl create -f manifests/


An easy way to access Prometheus, Grafana, and Alertmanager dashboards is by using kubectl port-forward once all the services are running:

Second method: Accessing Prometheus UI and Grafana dashboard using NodePort (Only for private clusters)
To access Prometheus, Grafana, and Alertmanager dashboards using one of the worker nodes IP address and a port you’ve to edit the services and set the type to NodePort.

The Node Port method is only recommended for local clusters not exposed to the internet. The basic reason for this is insecurity of Prometheus/Alertmanager services.


kubectl --namespace monitoring patch svc prometheus-k8s -p '{"spec": {"type": "NodePort"}}'

kubectl --namespace monitoring patch svc grafana -p '{"spec": {"type": "NodePort"}}'