1. Install Prometheus and Grafana using Helm

2. Prometheus server processes and stores metrics data

3. Alert manager sends alerts to any systems/channels

4. Grafana visualize scraped data in UI

----- install helm -------
 curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh

#- We need to add the Helm Stable Charts for your local client
- helm repo add stable https://charts.helm.sh/stable

#-  Add Prometheus Helm repo
- helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

#- create namespace for prometheus 
- kubectl create namespace prometheus

#- install prometheus 
- helm install stable prometheus-community/kube-prometheus-stack -n prometheus

#- grafana comming along with prometheus

#- edit prometheus service for access change service type  = clusterip to nodeport or loadbalancer
- kubectl edit svc stable-kube-prometheus-sta-prometheus -n prometheus

#- edit grafana service for access change service type      = = clusterip to nodeport or loadbalancer
- kubectl edit svc stable-grafana -n prometheus

#- use this command to get the password and username=admin
- kubectl get secret --namespace prometheus stable-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


#- grafana proetheus install by helm or anywhere no problem main this  in installation only 
# also create alerting system by pagerduty for pods and cpu utilization 

- command for alert like query 
 - 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# some queries for pagerduty
-metrics
http_server_requests_seconds_count
node_cpu_seconds_total

- Number of pods running per namespace.
[
sum(kube_pod_status_phase) by (namespace)
count(kube_pod_status_phase{phase="Running"})
sum(kube_pod_status_ready{namespace="monitoring", condition="true"})
]

- Pod CPU Usage (per pod)
[
sum(rate(container_cpu_usage_seconds_total{image!="", pod!=""}[5m])) by (pod, namespace)
]

- Pod Memory Usage (per pod)
[
sum(container_memory_usage_bytes{image!="", pod!=""}) by (pod, namespace)
]

- CPU Usage Across All Cores for nodes
[
100 - (avg(rate(node_cpu_seconds_total{mode="idle"}[5m])) by (instance) * 100)
]

- Memory Usage Percentage for nodes
[
(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes * 100
]

- Disk Usage Percentage
[
(node_filesystem_size_bytes{fstype!~"tmpfs|overlay"} - node_filesystem_free_bytes{fstype!~"tmpfs|overlay"}) / node_filesystem_size_bytes{fstype!~"tmpfs|overlay"} * 100
]

- Disk Space Availablility
[
node_filesystem_free_bytes{fstype!~"tmpfs|overlay"Disk
]

