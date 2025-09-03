# Helm + ArgoCD + github
- For image clone swiggy application repository in localmachine and build docker image from there and push into ecr that image .
- First store helm chart into github repository 
- like;  Github repository foolder structure
   
-   .
- ├── Chart.yaml
- ├── charts
- ├── templates
- │   ├── NOTES.txt
- │   ├── _helpers.tpl
- │   ├── deployment.yaml
- │   ├── hpa.yaml
- │   ├── ingress.yaml
- │   ├── service.yaml
- │   ├── serviceaccount.yaml
- │   └── tests
- │       └── test-connection.yaml
- └── values.yaml 

- create namespace in cluster for deploy the argocd process pods - helm

- You create an ArgoCD Application that points to your repo. 
- save this argo.yml file inside cluster 
```bash

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: swiggy-app
  namespace: helm
spec:
  project: default
  source:
    repoURL: 'https://github.com/<your-username>/<your-repo>.git'
    targetRevision: main   # head for recent comment 
    path: project-1     # path where Chart.yaml is stored
    helm:                                          
      parameters:
        - name: replicaCount
          value: "2"
        - name: image.repository
          value: "rakeshkanzariya/swiggy-application"
        - name: image.tag
          value: "latest"
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true       # remove resources not in Git
      selfHeal: true    # fix drift automatically```
      
------------------------------------------------------------------------------------------------------------------------------
-  kubectl apply -f argo.yml

- see argocd dashboard application was created 

- changes in github repsitory and push then see in argocd working .. 