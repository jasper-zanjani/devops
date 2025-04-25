Every persistent entity which represents the state of the Kubernetes system is called an **object**.
Objects describe the **desired state** of the cluster's workload, and the Kubernetes constantly strives to achieve and maintain desired state.

Almost all Kubernetes objects contain two nested fields: **spec**, which describes desired state, and **status**, which describes current state.
Every object type in the Kubernetes API has a **controller** (i.e. deployment controller, etc.) that reads desired state from the spec and reports its actual state by writing to the Status section.
Spec is most often provided by means of a YAML-format file known as a [**manifest**](#manifest).

Resource and object are often used interchangeably, but more precisely the resource refers to the URL path that points to the object, and an object may be accessible through multiple resources.

!!! info "Links"

    - [Kubernetes Spec Explorer](https://kubespec.dev/)
