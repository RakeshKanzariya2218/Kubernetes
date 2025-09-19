# Probs 


### The prob  is the health check of the pods like health check of target group 

1. Startup probs : 

- startup probs working at time of pod will creating if pod will not able to start then startup prob will again and again restart the pod.
- if after defien time restrat then pod will not ccreate than startup prob through the error like creashlookbackoff state 
- creashlookbackoff means pod inside the startup prob is fail .
- If pod start successffully then  after no any responsibility of startup prob .


2. Rediness Probs :

- Rediness prob is all about service 
- If rediness prob is fail means pod status ready(0/1) then pod is not ready 
- mens pod in running state but not in the ready state
- Whenever po is not ready the service not send any traffic to that pod 
- So when serrvice not traffic to pod then pods rediness prob will fail 


3. Liveness Prob : 
 
- Livenesss prob is running time issue is there in the pod then liveness prob will fail 
- Rnning time any issue occur then liveness prob  will fail 