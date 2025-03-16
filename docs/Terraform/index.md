# Terraform

!!! info "terraform"

    ```sh title="Commands"
    # Download modules specified in provider block
    terraform init

    # Validate configuration
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

Terraform configurations are written most commonly in [HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration), or less commonly in JSON.


<div class="grid cards" markdown>

```hcl title="Syntax"
block_type "label" "name_label" {
    key = "value"
    nested_block {
        key = "value"
    }
}
```

```hcl title="Hello, World!"
--8<-- "includes/tf/hello-world.tf"
```

</div>

The most basic Terraform file uses an API key to connect to the provider service.
Many providers are available for Terraform, but most of them are cloud-based.


<div class="grid cards" markdown>

```hcl title="IBM Cloud"
--8<-- "includes/tf/ibm/provider.tf"
```

```hcl title="Azure"
--8<-- "includes/tf/az/provider.tf"
```

</div>

[**Variables**](https://developer.hashicorp.com/terraform/language/values/variables){: #variables } allow values to be substituted without altering a module's source code.
Variables are declared in a **variable block** (1) and values can be [provided](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables) in various ways:
{: .annotate }

1.  

    ```hcl title="Variable definition"
    variable "name_label" {
        type = value
        description = "string"
        default = value
        sensitive = bool
    }
    ```

<!-- -->

-   Variable definition files using **-var-file**. Files named **terraform.tfvars** and **.auto.tfvars** are automatically parsed.

-   Environment variables prefixed with **`TF_VAR_`**

-   From the command-line using **-var**

Placing sensitive values in variable definition files allows sensitive data, such as passwords, API keys, or tokens, to be kept secret.

Terraform configurations mostly contain three types of object:

- **Providers** provide information about a provider plugin, i.e. AWS. There are various tiers of providers: official, partner, and community.  
- **Resources** are what is created within a target environment, i.e. a VM or a database
- **Data sources** are ways to query information from a provider.


#### Provisioners


**Provisioners** model specific actions in order to prepare servers or other infrastructure objects for service.
Provisioners are described as a last resort in Terraform documentation because their actions cannot be modeled as part of a plan.

[**local-exec**](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) invokes a local executable.

```hcl
provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
}
```

There is also a [null resource provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)

#### Outputs

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
