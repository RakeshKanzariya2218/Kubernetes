# Additional volume 

- We can use two types of addithional volumes: 
  1. static volume   
  2. Dyanlic volume 


2. Dynamic Volume :

- We use dynamic volume in storage class directly 

- when pod delete and create then volume automaticaly attached 

- if pod-1 delete then again pod-1 create because self healing 

- pod recreate with same name and same volume also      ----> statefulset

- if pod delete but volume not delete waiting for same name pod create when pod create attach immiiatly 
 

- Two condition are required 
 1. create add ons in cluuster ebs-csi driver ----> communication pod and volume ebs
 2. Iam permission required for nodegroup role to access ebs 

- pod creation start from 0 to onwords and deltion from if 3 then 2 to outwords

- addithion volume is there stay if cluster also delete 

- using rare case if logs are store in pods volume then using 


------------------------------------------------------------

- connfig map inside any value store then using 
- secrets are using when store username and password 

- configmap and secrets  are like a terraform variables.tf 




- Run these in sequence:

- kubectl apply -f config.yaml
- kubectl apply -f secrets.yaml
- kubectl apply -f storageclass.yaml
- kubectl apply -f statefulset.yaml

- for any pvc stuck in the terminetting state forcefully delete it run this command :

- kubectl delete pvc mysql-data-mysql-0 --grace-period=0 --force
