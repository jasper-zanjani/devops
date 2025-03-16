# Kubernetes

!!! info "kubectl"

    --8<-- "includes/Commands/kubectl/kubectl.md"


**Kubernetes** (Greek for "helmsman", "pilot", or "captain" and "k8s" for short) has emerged as the leading **container orchestrator** in the industry since 2018. 
It provides a layer that abstracts infrastructure, including computers, networks, and other computers, for applications deployed on top.

Kubernetes can be visualized as a system built from layers, with each higher layer abstracting the complexity of the lower levels.
One server serves as the **master**, exposing an API for users and clients, assigning workloads, and orchestrating communication between other components.
The processes on the master node are also called the **control plane**.
Other machines in the cluster are called [**nodes**](#node) or **workers** and accept and run workloads using available resources. 
A Kubernetes configuration files is called a [kubeconfig](#kubeconfig).


A [**pod**](https://jamesdefabia.github.io/docs/user-guide/pods/) is the most atomic unit of work which encompasses one or more **tightly-coupled** containers that will be deployed together on the same node.
All containers in a pod share the same Linux namespace, hostname, IP address, network interfaces, and port space.
This means containers in a pod can communicate with each other over localhost, although care must be taken to ensure individual containers do not attempt to use the same port.
However their filesystems are isolated from one another unless they share a [**volume**](#volume).

Every Pod occupies one address in a shared range, so communication between Pods is simple.

-   **replica**: an instance of a [pod](#pod)
-   [**service**](https://jamesdefabia.github.io/docs/user-guide/services): an abstraction over a logical set of Pods and a policy by which to access them, i.e. a microservice.
Because Pods are mortal, the **Service controller** keeps track of Pod addresses and publishes this information to the consumers of Services, a function called **service discovery**.
-   **worker** see [node](#node)

#### Object

Every persistent entity which represents the state of the Kubernetes system is called an **object**.
Objects describe the **desired state** of the cluster's workload, and the Kubernetes constantly strives to achieve and maintain desired state.

Almost all Kubernetes objects contain two nested fields: **spec**, which describes desired state, and **status**, which describes current state.
Every object type in the Kubernetes API has a **controller** (i.e. deployment controller, etc.) that reads desired state from the spec and reports its actual state by writing to the Status section.
Spec is most often provided by means of a YAML-format file known as a [**manifest**](#manifest).

Resource and object are often used interchangeably, but more precisely the resource refers to the URL path that points to the object, and an object may be accessible through multiple resources.

!!! info "Links"

    - [Kubernetes Spec Explorer](https://kubespec.dev/)

## Concepts

<div class="grid cards" markdown>

-   #### Configuration

    ---

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

-   #### Namespaces

    ---

    Kubernetes [namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) provide a mechanism for logically grouping and isolating resources within a cluster.
    
    Various namespaces exist by default, called [**initial namespaces**](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/). (1)
    {: .annotate }

    1. 
        - **default**
        - **kube-node-lease**
        - **kube-public**
        - **kube-system**

-   #### History

    ---

    Kubernetes was first announced by Google in mid-2014. 
    It had been developed by Google after deciding to open-source the Borg system, a cluster and container management system that formed the automation infrastructure that powered the entire Google enterprise.
    Kubernetes coalesced from a fusion between developers working on Borg and Google Compute Engine. 
    Borg eventually evolved into Omega.

    By that time, Amazon had established a market advantage and the developers decided to change their approach by introducing a disruptive technology to drive the relevance of the Compute platform they had built. 
    They created a ubiquitous abstraction that could run better than anyone else.

    At the time, Google had been trying to engage the Linux kernel team and trying to overcome their skepticism. 
    Internally, the project was framed as offering "Borg as a Service", although there were concerns that Google was in danger of revealing trade secrets.

    Google ultimately donated Kubernetes to the [**Cloud Native Computing Foundation**](https://www.cncf.io/).

    Kubernetes's heptagonal logo is an allusion to when it was called "Project 7" as a reference to Star Trek's Borg character 7 of 9.

-   #### Manifest

    ---

    A **manifest** is a (usually) YAML-format file that represents the declarative configuration of a Kubernetes [object](#objects) (although it can also be in JSON, and the kubectl utility will convert the YAML to JSON when executing API calls).

    ```yaml
    --8<-- "includes/kubernetes/spec/deployment.yaml"
    ```

    A manifest contains various fields:

    - **apiVersion** usually "v1"
    - **kind** type of object
    - **metadata** including name
    - **spec**: desired state

    An explanation of each field available in the API of any object type can be displayed on the command-line

    ```sh
    kubectl explain nodes
    kubectl explain no.spec
    ```

    ```sh title="Display the manifest of a node"
    kubectl get node $NODE -o yaml
    kubectl describe node kind-worker-2
    ```


    Compute resources of containers can be limited at **pod.spec.containers.resources**.

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
        resources:
        requests:
          memory: "64Mi"
          cpu: "500m"
          limits:
            memory: "128Mi"
            cpu: "500m"
    ```

    Volumes are declared in **.spec.volumes** and mounted into containers in **.spec.containers[\*].volumeMounts**.

    === "emptyDir"

        ```yaml
        apiVersion: v1
        kind: Pod
        metadata:
        name: alpine
        spec:
        volumes:
        - name: data
          emptyDir:
        containers:
        - name: alpine
          image: alpine
          volumeMounts:
          - mountPath: "/data"
            name: "data"
        ```

    === "hostPath"

        ```yaml
        apiVersion: v1
        kind: Pod
        metadata:
        name: alpine
        spec:
        volumes:
            - name: data
            hostPath:
                path: /var/data
                
        containers:
        - name: alpine
            image: alpine
            volumeMounts:
            - mountPath: "/data"
                name: "data"
        ```

    === "gcePersistentDisk"

        ```yaml
        apiVersion: v1
        kind: Pod
        metadata:
        name: alpine
        spec:
        volumes:
            - name: data
            gcePersistentDisk:
                pdName: my-disk
                fsType: ext4
        containers:
        - name: alpine
            image: alpine
            volumeMounts:
            - mountPath: "/data"
                name: "data"
        ```




-   #### Probes

    ---

    Kubernetes can monitor Pod health by using **probes**, which can be categorized by how they measure health:

    - [**Readiness**](#readiness-probe): i.e. Is the container ready to serve user requests?
    - **Liveness**: i.e. Is the container running as intended?

    In Kubernetes, **Volumes** are an abstraction of file systems accessible from within a Pod's containers.

    - Network storage device, such as [**gcePersistentVolume**](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir)
    - [**emptyDir**](#emptydir), where the data is stored in RAM using Docker's tmpfs file system
    - **hostPath**, where the volume is located within the node's file system. Because pods are expected to be created and destroyed on any node (which may themselves be destroyed and recreated), hostPath volumes are discommended.

-   #### Selector

    ---

    A [**label selector**](https://jamesdefabia.github.io/docs/user-guide/labels/#label-selectors) provides a way to identify a set of objects and is the core grouping primitive supported by Kubernetes.
    It can be made of multiple **requirements** that are comma-separated, all of which must be satisfied.

    There are two types of selector:

    - [**Equality-based** <sup>:material-kubernetes:</sup>](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#equality-based-requirement) admits the operators **=**, **!=**, and **==**.
    - [**Set-based** <sup>:material-kubernetes:</sup>](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#set-based-requirement) admits the operators **in**, **notin**, and **exists**.

    === "Equality-based selector"

        ```
        environment = production
        tier != frontend
        ```

    === "Set-based selector"

        ```
        environment in (production, qa)
        tier notin (frontend, backend)
        partition
        !partition
        ```

</div>
