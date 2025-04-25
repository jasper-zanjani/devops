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
