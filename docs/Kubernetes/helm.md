# Helm

```sh
helm repo add opsmx https://helmcharts.opsmx.com/

# Confirm
helm repo ls

# Install helm chart
helm install my-hello-kubernetes opsmx/hello-kubernetes --version 1.0.3

# Confirm
helm list

# New pods, deployments, and services
kubectl get pods
kubectl get deployments
kubectl get services
```