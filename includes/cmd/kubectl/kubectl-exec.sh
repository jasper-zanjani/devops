# Execute a command on a pod with only a single container, returning output
kubectl exec $pod -- env

# Get a shell to a running container
kubectl exec --stdin --tty $pod -- /bin/bash

# When a pod contains more than one container, the container must be specified
kubectl exec --stdin --tty $pod --container $container -- /bin/bash