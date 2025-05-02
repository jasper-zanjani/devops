# List managed Kubernetes clusters
az aks list

# Inspect a single cluster
az aks show -g $RG -n $CLUSTER_NAME -o table

# Get Kubernetes context, saving it in $HOME/.kube/config
az aks get-credentials -g $RG -n $CLUSTER_NAME

# Display available AKS versions in the location
az aks get-versions -l eastus

# Get upgrade versions available for a specific cluster
az aks get-upgrades -g $RG -n $CLUSTER_NAME

# Upgrade an AKS cluster
az aks upgrade -g $RG -n $CLUSTER_NAME  \
    --kubernetes-version "1.28.5"

# Upgrade only the control plane of an AKS cluster
az aks upgrade -g $RG -n $CLUSTER_NAME  \
    --control-plane-only                \
    --kubernetes-version "1.28.5"

# Upgrade node pool of a cluster
az aks nodepool upgrade -g $RG -n $NODEPOOL_NAME \
    --kubernetes-version "1.28.5"