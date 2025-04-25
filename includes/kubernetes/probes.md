Kubernetes can monitor Pod health by using **probes**, which can be categorized by how they measure health:

- [**Readiness**](#readiness-probe): i.e. Is the container ready to serve user requests?
- **Liveness**: i.e. Is the container running as intended?

In Kubernetes, **Volumes** are an abstraction of file systems accessible from within a Pod's containers.

- Network storage device, such as [**gcePersistentVolume**](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir)
- [**emptyDir**](#emptydir), where the data is stored in RAM using Docker's tmpfs file system
- **hostPath**, where the volume is located within the node's file system. Because pods are expected to be created and destroyed on any node (which may themselves be destroyed and recreated), hostPath volumes are discommended.
