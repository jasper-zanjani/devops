All Kubernetes clusters have two categories of [users](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#users-in-kubernetes):

- **service accounts** managed by Kubernetes
- **normal users**: any user that presents a valid certificate signed by the cluster's certificate authority is considered authenticated.