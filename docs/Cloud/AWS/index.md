# Overview

!!! info "Resources"

    - [AWS CLI docs](https://docs.aws.amazon.com/cli/latest)

Global infrastructure:

- 31 regions
- 99 availability zones

A region is a geographical area

Availability zone is a datacenter.

All availability zones are within 100 km of each other, although each is separated from another by a significant distance.

Edge locations are endpoints used for caching content through CloudFront.


#### AWS CLI


<div class="grid cards" markdown>

-   #### Login

    ---

    AWS CLI options, including login credentials, are managed with the [**configure**](https://docs.aws.amazon.com/cli/latest/reference/configure/) command.

    ```sh
    # Interactively provide Access and Secure Keys
    aws configure
    ```

    The keys are stored in a cleartext INI config at **$HOME/.aws/credentials**; AWS CLI settings are stored in another INI config at **$HOME/.aws./config**.

    Configuration values, including the secret key, can be displayed using [**get**](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/get.html)

    ```sh
    aws configure get aws_secret_access_key
    ```

    Credentials can also be displayed or exported using [**export-credentials**](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/export-credentials.html)

    ```sh
    aws configure export-credentials
    ```


-   #### Profiles

    ---

    Without specifying one, a profile named "default" is created on first providing access credentials.

    Additional profiles can be created to manage multiple accounts.

    ```sh title="Profiles"
    # Start a new profile named corp for corporate access
    aws configure --profile corp

    # Confirm
    aws configure list-profiles
    ```

</div>


## EKS

**Elastic Kubernetes Service** 

### Tasks

<div class="grid cards" markdown>

-   #### Clusters

    ---

    ```sh
    aws eks list-clusters

    # Add new context to .kube/config
    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
    ```


</div>

### Other services

<div class="grid cards" markdown>


-   #### Shared storage

    ---

    - **EFS** (Elastic File Store) is a managed NFS service that can be shared among thousands of EC2 instances for Linux
    - **FSx** is a managed SMB file service for Windows
    - **FSx for Lustre** 

-   #### Systems Manager

    Most **Amazon Machine Images (AMI)** come with the Systems Manager agent preinstalled.
    The IAM policy **AmazonSSMManagedInstanceCore** needs to be attached at a minimum.

-   - **Backup**

    


</div>