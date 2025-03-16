[Upgrading an AKS cluster](https://learn.microsoft.com/en-us/azure/aks/upgrade-aks-cluster?tabs=azure-cli) 

```sh
# Upgrade an AKS cluster
az aks upgrade -g $RG -n $CLUSTER_NAME  \
    --kubernetes-version "1.28.5"
```

Optionally, the process can be divided into two steps, to upgrade the control plane and node pool separately:

```sh
# Upgrade only the control plane of an AKS cluster
az aks upgrade -g $RG -n $CLUSTER_NAME  \
    --control-plane-only                \
    --kubernetes-version "1.28.5"

# Upgrade node pool of a cluster
az aks nodepool upgrade -g $RG -n $NODEPOOL_NAME \
    --kubernetes-version "1.28.5"
```