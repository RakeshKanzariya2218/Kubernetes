- Default schedule : Scheduler schedule pods as per resource availability schedule pods on any nodes.

- Custom Schedule : We can define pod need to schedule on which node.

- In case of maintanance we can mention a condition like no pod deploy on specific ( under maintanance ) node untill complete the maintanance.

- There are four type of custom scheduler :
  
  - Node Selector schedule 
  - Node Affinity schedule
  - Tain toleration schedule
  - Demonset schedule

1. Node Selector Schedule :
  
  - In this case we labeld any node and then after that label configure in pod's deployment.yaml file , that ensure in this yaml file  whichever pods are schedule on the that labeled node only.

  condition-1: Unlabeled deployment with labeled node.
             - work as a default schedule behaviour 
  
  condition-2: Labeled pod with labeled node.
             - All pods schedule on labeled node

  condition-3: Make unalebeled node after schedule the pods on labeled node.
             - As it is all pods are stay on labeled node because schedule responsibility only apply time one create and schedule pods after that scheduler not responsible for pods are where runni.

  condition-4: Labeled pods schedule on unlabeled nodes.
             - Not scheduled go in pending stete , because deployment inside pods are labeled but any node are not labeled so scheduler try to find match labels is there not any label match then it stay in pending state.
             - Again make any one node as labeled (match) then quickly all pods are schedule on that node.
    


2. Demonset :
 
   - Each pods are schedule on each node.
   - In demonset.yaml inside no replicas section so all pods are schedule on each node.
   - Main using in monitoring like grafana prometheus , in this case node exporter( prometheus pod ) should run on every node for collect metrics of all nodes.
   - If node count increase then pod automaticaly schedule on that node.


3. Node Affinity : 
   
    1. Node affinity prefered :-
       - Node affinity is little advance version of nodeselector, pod not in pending state.
       - In case of prefered it means I say to scheduler , Prefer the pods on specific node but any reason to scheduler not able to schedule pod on that node then schedule pod on another node.

    2. Node affinity required :- 
       - 