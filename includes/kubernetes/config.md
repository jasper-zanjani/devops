[Kubeconfig](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) files allows kubectl to choose a cluster and communicate with its API server
They are conventionally stored at **~/.kube/config**, but alternative locations can be specified using the [**$KUBECONFIG**](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/#set-the-kubeconfig-environment-variable) environment variable and the **--kubeconfig** option.

```sh
# View merged kubeconfig settings
kubectl config view
```

Within a kubeconfig, a [**context**](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#context) element is used to group access parameters under a convenient name.

```sh
--8<-- "includes/Commands/kubectl/kubectl-contexts.sh"
```
