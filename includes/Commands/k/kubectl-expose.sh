# Expose a port
kubectl expose deployment/nginx --port=80 --type=LoadBalancer