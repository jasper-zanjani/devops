kubectl create deployment nginx --image=nginx

# Number of replicas can be set on creation of a deployment by specifying an argument to --replicas
kubectl create deployment nginx --image=nginx --replicas=4