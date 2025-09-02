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


