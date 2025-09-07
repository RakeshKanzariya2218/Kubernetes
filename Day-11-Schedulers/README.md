# Scheduler :


- Default scheduler : Schedule pods as per the resorce avialability schedule pods on any nodes.
- Custom schedduler : We can define pod need to be schedule on which node.


- Four types of schedulers:
  - Node Exporter
  - Node Affinity
    - Nodeaffinity-prefered
    - Nodeaffinity-required
  - Demonset
  - Taint and Tolerance
-----------------------------------------------------
1. NodeExporter :-
   - Nodesecctor means pod can schedule on the specicfic labeled node only if label is not match pods are stay in pending state.
   - conditions: 
     1. unalbeled deployment with labeled node : 
       - work as a default scheduler behaviour
       - pod can schedule on any nodes


     
     2. labeled pods with labeled node :
       - all pods schedule on labeled node only.(if there are two node one labeled and scond unlabeled theb all are deploy on labeled node only )



     3. unlabel the node after schedule pod on labeled node (which are lableled) :
       - all pods are as it is because schedule work only schedule time after schedule the pods scheduler is not responsible.
       - sclae up deployment and scale down deploymet and chech pods are in pending state,
       - label are not match pods delete and again receate then stay in pending state.
       - if label pod with NoExecute then running time pods also move on unlabeled node because NoExecute running time also scheduler work.



     4. labels pods schedule on unlabeld node :
       - it is not posiible.


----------------------------------------------------------

2. Demonset : 
   - Demonset mostly using in monitoring 
   - it means all pods schedule  on all nodes
   - if node count increase then pods are automaticaly schedule on new node
   - grafana prometheus inside nodeexporter shuld run in all node then use demonset
   - unlabele all node and try with demonset.yaml

-----------------------------------------------------------



3. Node Affinity: 
   - it is advance version of nodeselector.
   - two types of nodeaffinity: 
     1. Node-affinity-prefered
     2. Node-affinity-required


       1. Nodeaffinity prefered :
         - it means i prefer to schedule the pods schedule on specific labeled node but any issue with that node like resource unavailability the pods can schedule on another node .
         - pods can not go in pending state.


       2. Nodeaffinity required :
         - in this case any one label should match with pods then pods can schedule on specific labeled node another stay in pending state.

----------------------------------------------------------



4. Taint and Toleration : 
   - untolarate pods can schedule only on untaineted node.
   - tolarate pods can schedule any node tainted or untainted
   - it means all pods are untolarate and make one node as taint then that node is completely isolated

   - NoScheduler : Scheduler not responsible after schedule the pods
   - NoExecute   : Scheduler also responsible after schedule the pods


   
    1. pods - NoSchedule           ( deployment inside effect )
       nodes - NoSchedule          ( node tainetd by noschedule )
        - pods can deploy on nay nodes 



     2. pods - NoSchedule 
        nodes - NoExecute
         - only schedule or move on untainted nodes



     3. pods - NoExecute
        nodes - NoSchedule
         - all pods are schedule on untainted nodes



     4. pods - NoExecute
        nodes - NoExecute
         - all pods are schedule on any nodes 

         

- scheduler choose best fit if labels are match then pods allow to schedule on tainted node but scheduler chose best fit means if ubtainted node are more available then first priority is untainted nodes.
    
