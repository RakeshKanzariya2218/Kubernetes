# service account # 

- pod is kubernetes entity not aws then hoe to give aws service permisssion to pod.

- When we want to specfic permision to specific pod then use service account concept.

- If give permission to nodegroup iam role then also pod able to access aws other services.

- But nodelevele permission is enable for all pods that is not good practice

- so give specific pod to specific aws service permission = service account 

# process :

- Create  policy 
- Enable OIDC 
- Create service account or service role 
- Attach policy to service role
- Use service account inside pod.yaml - under spec:

1. Create a policy with specific permission whicever permission want to give a specific pod.

vi pod-s3-policy.json   # save this file in ec2 server.
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
```

2. create  policy 
```
aws iam create-policy \
  --policy-name eks-pod-s3-fullaccess \
  --policy-document file://pod-s3-policy.json
```

3. Enable OIDC for connection to aws service.

- eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster rakesh --approve

4. create service account role and attach policy

```
eksctl create iamserviceaccount \
  --name s3-access-sa \
  --namespace default \
  --cluster rakesh \
  --region us-east-1 \
  --attach-policy-arn arn:aws:iam::451947743144:policy/eks-pod-s3-fullaccess \
  --approve
```

5. save pod.yaml  with serviceaccount section
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-1
  labels:
    app: myapp
spec:
  serviceAccountName: s3-access-sa
  containers:
  - name: awscli
    image: amazonlinux:2
    command: ["sleep", "3600"]
```

---------------------------------------------------------

- if you want to update the seervicerole account then run bellow command and edit the policy.

      - kubectl edit sa s3-access-sa -n default

- if policy adit then edit directly.
       - create role attach required permissiion and edit role arn in serviceaccount role.

----------------------------------------------------------------

1. List all ServiceAccounts in default namespace

  - kubectl get sa


2. List ServiceAccounts in a specific namespace

   - kubectl get sa -n kube-system

3. Describe a ServiceAccount (to see IAM role annotations for IRSA)

   - kubectl describe sa s3-access-sa -n default

4. Get YAML output for a ServiceAccount

    - kubectl get sa s3-access-sa -n default -o yaml                # This is useful to confirm the OpenID Connect annotation is there.

5.If you want to update the ServiceAccount annotation

     - kubectl edit sa s3-access-sa -n default

------------------------------------------------------------------

- Permission - iam role - ec2 <--- permission

- Policy - service account - pod <--- permission 

# OIDC for connection pod to aws service 
# service account for authentication 


