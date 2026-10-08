!!! tip "podman"

    === ":material-star: Common"

        ```sh
        --8<-- "includes/cmd/podman/podman-run.sh"
        ```

    === "port"

        ```sh
        # Display mapped ports
        podman port $CONTAINER
        ```

    === "pull"

        ```sh
        --8<-- "includes/cmd/podman/podman-pull-kustainer.sh"
        ```

    === "run"

        ```sh
        --8<-- "includes/cmd/podman/podman-run-kustainer.sh"
        ```




With few exceptions, **podman** (1) exposes a command-line API that closely imitates that of Docker.
{: .annotate }

1.  !!! tip "Command reference"

        --8<-- "includes/cmd/podman/reference.md"

    **Directories**

    -   Repo aliases: **/etc/containers/registries.conf.d** 
        (RHEL and derivative distributions support additional aliases, some of which reference images that require a [login](https://access.redhat.com/RegistryAuthentication#red-hat-registries-1).
        For example, Red Hat offers a Python 2.7 runtime from the RHSCL ([Red Hat Software Collections](https://developers.redhat.com/products/softwarecollections/overview)) repository on registry.access.redhat.com, which does not require authentication.
        However, Python 3.8 is only available from registry.redhat.io, which does.
        Interestingly, other Python runtimes are available from the ubi7 and ubi8 repos from unauthenticated registries.)
    -   Container images: **\$HOME/.local/share/containers/storage**

The **Z** option is necessary on SELinux systems (RHEL and derivatives) when mounting volumes and tells podman to label the content with a private unshared label.
On systems running SELinux, rootless containers must be explicitly allowed to access bind mounts.
Containerized processes are not allowed to access files without a SELinux label.

#### Namespaces

--8<-- "includes/cmd/podman/userns.md"

## Tasks

#### Systemd service

--8<-- "includes/cmd/podman/systemd-service.md"

