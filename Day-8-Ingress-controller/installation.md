- kubectl create ns ingress-nginx 
- kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml


- install ingress from anywhere no problem 
- ingress controller support path based routing 
- inside ingress.yml if you give host: domain then it will only accesible by domain name  
- but if yiu dinet mention any host then it will accesible by domain(route53) and loadbalancer both 

- process

- route53 - loadbalancer - ingress controller - service - pods.yml( pth wise applicatioon )

- inside ingress controller communicate with svc.yml by service name  -->

- inside ingress.yaml
- annotations:
  nginx.ingress.kubernetes.io/rewrite-target: /$2       = means 
- "Take whatever matches the URL path, then rewrite it and send only the part in $2 to the backend service."
