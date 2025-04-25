A **manifest** is a (usually) YAML-format file that represents the declarative configuration of a Kubernetes [object](#objects) (although it can also be in JSON, and the kubectl utility will convert the YAML to JSON when executing API calls).

```yaml
--8<-- "includes/configs/spec/deployment.yaml"
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

