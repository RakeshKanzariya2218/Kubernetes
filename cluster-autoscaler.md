🚀 Cluster Autoscaler Setup on Amazon EKS
This guide walks you through installing and configuring the Cluster Autoscaler on an Amazon EKS cluster using the AWS cloud provider.
-----------------------------------------------------------------------------------------------------



1️⃣ Deploy Cluster Autoscaler

Apply the official Cluster Autoscaler manifest for your Kubernetes version (adjust 1.29.0 if needed):

---------install autoscaller as a yml file --------

kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/cluster-autoscaler-1.29.0/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml



2️⃣ Verify the Pod

--- autoscaller run as a pod inside kube-system namespace which is run in kube-system namespace---

kubectl -n kube-system get pods -l app=cluster-autoscaler

Expected output:


NAME                                  READY   STATUS    RESTARTS   AGE
cluster-autoscaler-6889f6cf54-7pcsh   1/1     Running   0          2m

3️⃣ Edit Deployment (Add Cluster Name)
Edit the deployment to configure your cluster name:
-- edit deployment.yml(autoscaler yml fiel) to add that autoscaler into your cluster which was you created. ---

kubectl -n kube-system edit deployment.apps/cluster-autoscaler

edit <CLUSTER NAME>


4️⃣ Configure IAM Permissions
Cluster Autoscaler requires IAM permissions to scale nodes.
Go to your EKS Node Group IAM Role and attach the following policy.

👉 Either attach AmazonEKSClusterAutoscalerPolicy (AWS Managed)
or create a custom IAM policy with the JSON below.

Example IAM Policy JSON


{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeTags",
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "ec2:DescribeLaunchTemplateVersions"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
Attach this to your Node Group Role.



5️⃣ Update Node Group Scaling Config
Set your min/max/desired node counts for the autoscaler:

aws eks update-nodegroup-config \
  --cluster-name <cluster name> \
  --nodegroup-name <node group name> \
  --scaling-config minSize=2,maxSize=6,desiredSize=3
  or 
  ======while cluster creating time create cluster with the command :

  eksctl create cluster --name rakesh --region us-east-1 --node-type t2.smll --nodes-min 2 --nodes-max 6 --nodes 3

6️⃣ Check Autoscaler Logs
Watch the logs to confirm the autoscaler is working:


kubectl -n kube-system logs -f deployment/cluster-autoscaler

✅ Validation
Deploy a test workload with more pods than your current node capacity:


kubectl create deployment nginx --image=nginx --replicas=50
Check if new nodes are being added:


kubectl get nodes -w
Scale down pods and watch nodes reduce (if below maxSize and above minSize):


kubectl scale deployment nginx --replicas=1
📝 Notes
minSize ensures at least 2 nodes are always running.

maxSize sets the upper scaling limit.

desiredSize is the starting point but will be adjusted dynamically.

Ensure your Node Group IAM Role has autoscaling permissions, otherwise the pod will stay in Pending or fail to scale.

Only one Cluster Autoscaler pod should be running per cluster (it uses leader election).