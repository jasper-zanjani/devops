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

