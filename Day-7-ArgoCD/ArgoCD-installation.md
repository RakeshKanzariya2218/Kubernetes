ArgoCD is a Continous Deployment Tool
Kubernetes native tool is argocd
ArgoCd offers GitOps process
In Argocd deployment process 
- developer push the changes in github yml file 
- argocd everytime continously watching the github repository
- when developer make any changes in repository yml file than argocd quickly deploy that yml file in the nodes
- inn this case developer no need to connect cluster and deploy yml file manually in nodes
- so developer no need to connect cluster inspec troubleshoot 

The flow: 

Developer --> githuub --> ArgoCD --> connect cluster and deploy the yml file

-----------------------------------------------------------------------------------------------------
==> First create "argocd" namespace in eks-client because argocd install in "argocd" namespace

-----1. install argocd in cluster nodes:

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

-----2. edit argocd service type for access externally to argocd 
 
 kubectl edit svc argocd-server -n argocd   ##  chane servicetype : ClusterIP to LoadBalancer or NodePort

-----3. Get secret password of argocd :

kubectl get secret argocd-initial-admin-secret -n argocd -o yaml

-----4. decode the password:  username = admin (default)

echo "secret value" | base64 --decode

- create new application and proceed with github repository yml file.



