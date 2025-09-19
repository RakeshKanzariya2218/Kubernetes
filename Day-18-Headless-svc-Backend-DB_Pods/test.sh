apiVersion: v1
kind: Pod
metadata:
  name: dns-client
spec:
  containers:
  - name: dns-client
    image: busybox
    command: ["sleep", "3600"]





