```sh
kubectl run nginx --image=nginx
kubectl delete pod nginx
```

=== "api-resources"

    ```sh
    # List Kubernetes objects
    kubectl api-resources
    ```

=== "config"

    ```sh
    # Show available contexts
    kubectl config get-contexts

    # Switch to a different context
    kubectl config use-context $NAMESPACE
    kubectl config use $NAMESPACE
    ```

=== "create"

    ```sh
    kubectl create deployment nginx --image=nginx

    # Number of replicas can be set on creation of a deployment by specifying an argument to --replicas
    kubectl create deployment nginx --image=nginx --replicas=4
    ```

=== "describe"

    ```sh
    kubectl describe nodes/gke-*4ff6f64a-6f4v
    ```

=== "exec"

    ```sh
    # Execute a command on a pod with only a single container, returning output
    kubectl exec $pod -- env

    Get a shell to a running container
    kubectl exec --stdin --tty $pod -- /bin/bash

    # When a pod contains more than one container, the container must be specified
    kubectl exec --stdin --tty $pod --container $container -- /bin/bash
    ```

=== "explain"

    ```sh
    # Get a description of a resource
    kubectl explain nodes.status.addresses.address
    ```

=== "expose"

    ```sh
    # Expose a port
    kubectl expose deployment/nginx --port=80 --type=LoadBalancer
    ```

=== "get"

    ```sh
    # Display resources"
    kubectl get nodes
    kubectl get pods
    kubectl get deployments
    ```

=== "scale"

    ```sh
    # Replica count is set in an existing deployment by **scaling**
    kubectl scale deploy/nginx --replicas=2
    ```



