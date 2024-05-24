# Terraform

```sh title="Command-line usage"
# Download modules specified in provider block
terraform init

# Validate scripts
terraform validate

# Dry-run
terraform plan

# Create resources
terraform apply

# Skip approval prompt with auto-approve
terraform apply -auto-approve

# Remove resources
terraform destroy
```

There are three main object types:

- **Providers** provide information about a provider plugin, i.e. AWS. There are various tiers of providers: official, partner, and community.  
- **Resources** are what is created within a target environment, i.e. a VM or a database
- **Data sources** are ways to query information from a provider.


```hcl
--8<-- "includes/tf/hello-world.tf"
```

<div class="grid cards" markdown>

-   #### Configuration

    ---

    Terraform configurations are written most commonly in [HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration), or less commonly in JSON.

    ```hcl title="Syntax"
    block_type "label" "name_label" {
        key = "value"
        nested_block {
            key = "value"
        }
    }
    ```

-   #### Providers

    ---

    Many providers are available for Terraform, but most of them are cloud-based.
    There do appear to be providers available for TrueNAS, Hyper-V, and [libvirt](https://dev.to/ruanbekker/terraform-with-kvm-2d9e).


-   #### Provisioners

    ---

    **Provisioners** model specific actions in order to prepare servers or other infrastructure objects for service.
    Provisioners are described as a last resort in Terraform documentation because their actions cannot be modeled as part of a plan.

    [**local-exec**](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) invokes a local executable.

    ```hcl
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"
    }
    ```

    There is also a [null resource provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)

-   #### Variables

    ---

    [**Input variables**](https://developer.hashicorp.com/terraform/language/values/variables) allow values to be substituted without altering a module's source code.
    They are declared in a **variable block** and values can be [provided](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables) in various ways:

    - Environment variables prefixed with **`TF_VAR_`**
    - From the command-line using **-var**
    - Variable definition files using **-var-file**. Files named **terraform.tfvars** and **.auto.tfvars** are also automatically parsed.

    ```hcl title="Variable definition"
    variable "name_label" {
        type = value
        description = "string"
        default = value
        sensitive = bool
    }
    ```

-   #### Secrets

    ---

    Terraform searches for [environment variables](https://developer.hashicorp.com/terraform/language/values/variables#environment-variables) whose identifiers begin with **`TF_VAR_`**.
    This allows secrets to be placed in a .env file which can then be sourced in the shell before running terraform.


    ```hcl title="vars.tf"
    variable "aws_access_key" {
        type = string
        description = "AWS Access Key"
        sensitive = true
    }

    variable "aws_secure_key" {
        type = string
        description = "AWS Secret Key"
        sensitive = true
    }
    ```

    For the variable definition above, the .env file should contain definitions for the variables **`TF_VAR_aws_access_key`** and **`TF_VAR_aws_secure_key`**:

    ```sh title=".env"
    TF_VAR_aws_access_key=...
    TF_VAR_aws_secure_key=...
    ```

-   #### Outputs

    ---

    [**Output values**](https://developer.hashicorp.com/terraform/language/values/outputs) make information about infrastructure available on the command-line.
    Outputs are displayed after a configuration run and are also stored in the state data.

    ```sh
    terraform output region

    # Omit quotes and final newline, outputting only the string value itself (useful for scripting) (1)
    terraform output -raw region
    ```

    1. 
    ```sh hl_lines="3-4"
    # Add new context to .kube/config
    aws eks update-kubeconfig \
        --region $(terraform output -raw region) \
        --name $(terraform output -raw cluster_name)
    ```

    Resources:

    - [PluralSight - Terraform - Getting Started - Output values syntax](https://app.pluralsight.com/ilx/video-courses/fa1fd952-76e1-4807-a0e2-3499c9b5f11b/4e006d39-6d6f-4a37-8bb5-1e2ee555aa68/886f68c4-1d6d-4c37-8056-7282a4c5e031)

</div>

## Tasks

### :material-aws:{ .lg .middle } AWS

#### User creation

```terraform 
--8<-- "includes/tf/aws-iam.tf"
```

#### VM

```terraform
--8<-- "includes/tf/aws-instance.tf"
```

#### EKS

=== "main.tf"

    ```terraform
    --8<-- "includes/tf/aws-eks/main.tf"
    ```

=== "terraform.tf"

    ```terraform
    --8<-- "includes/tf/aws-eks/terraform.tf"
    ```

=== "outputs.tf"

    ```terraform
    --8<-- "includes/tf/aws-eks/outputs.tf"
    ```

=== "variables.tf"

    ```terraform
    --8<-- "includes/tf/aws-eks/variables.tf"
    ```
