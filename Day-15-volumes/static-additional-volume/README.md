# Additional volume 

- We can use two types of addithional volumes: 
  1. static volume   
  2. Dyanlic volume 

1. in case of static volume we need to create volume manually and attach volume id in the pv.yaml
  - in static volume three yaml are using 
   - pv.yaml      #   inside this configure volume id 
   - pvc.yaml
   - deployment.yaml 

- pv.yaml attach with the static volume  and give volume to pvc.yaml
- pvc.yaml attach with deploy.yaml and give  volume to deploy.yaml
- this is the process of static volume as additional 
