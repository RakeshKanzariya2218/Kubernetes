# Headless service 

- Backend pod to databasse pod communication is possible two wyas 
 1. Headless service
 2. ClusterIP service

###  Cluster Ip service

- In this case backend pod to database connect through cluster ip service that time cluster ip send traffic to any data base pod which is not correct 
- if database is rds or any pod is there than no proble for this
- if database pod are two or more then clusterip service is not usefull service 


### Headless servce

- Headless service send traffic to any one specific node 
- backend pod send traffic to its db pod is correct 
- if multiple db pod would there then headless service is usefull 




### how to send traffic any one specific node ?
 - connect backend pod `kubectl exec -it dns-client -- sh` and run the command :
 ```
 <pod-name>.<headless-service-name>.<namespace>.svc.cluster.local

nslookup mysql-0.mysql.default.svc.cluster.local
nslookup mysql-1.mysql.default.svc.cluster.local
nslookup mysql-2.mysql.default.svc.cluster.local
```


### if use cluster ip insted of headless service then 

```
 <pod-name>.<ClusterIP-service-name>.<namespace>.svc.cluster.local
```
- it will redirecting into service ip 
- service send traffic to any pod. 

