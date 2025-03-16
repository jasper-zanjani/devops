```sh
kubectl run nginx --image=nginx
kubectl delete pod nginx
```

=== "api-resources"

    ```sh
    # List Kubernetes objects
    kubectl api-resources
    ```

=== "apply"

    ```sh
    # Apply a manifest
    kubectl apply -f https://k8s.io/examples/application/deployment.yaml # (1)
    ```

    1. 
    ```yaml title="deployment.yaml"
    --8<-- "includes/kubernetes/spec/deployment.yaml"
    ```

=== "config"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-config.sh"
    ```

=== "create"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-create.sh"
    ```

=== "describe"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-describe.sh"
    ```

=== "exec"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-exec.sh"
    ```

=== "explain"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-explain.sh"
    ```

=== "expose"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-expose.sh"
    ```

=== "get"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-get.sh"
    ```

=== "scale"

    ```sh
    --8<-- "includes/Commands/kubectl/kubectl-scale.sh"
    ```



