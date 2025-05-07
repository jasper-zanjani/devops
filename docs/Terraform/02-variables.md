# Variables

[Variables](https://developer.hashicorp.com/terraform/language/values/variables){: #variables } allow values to be substituted without altering a module's source code.
Variables are declared in a variable block (1).  
{: .annotate }

1.  

    ```terraform title="Variable definition"
    variable "name_label" {
      type = value
      description = "string"
      default = value
      sensitive = bool
    }
    ```

    -   Setting a variable as [`sensitive`](https://developer.hashicorp.com/terraform/language/values/variables#suppressing-values-in-cli-output) will suppress its output when running `plan` or `apply`.

<!-- -->

Values can be [provided](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables) in various ways:

-   Files in the project directory named **terraform.tfvars** and **.auto.tfvars** are automatically parsed.

-   Other variable definition files can be specified by passing their filenames to **-var-file**. 

-   Individual variable values can be passed from the command-line using **-var**

-   Environment variables prefixed with **`TF_VAR_`**

Placing sensitive values in variable definition files allows sensitive data, such as passwords, API keys, or tokens, to be kept secret.

Terraform configurations mostly contain three types of object:

- **Providers** provide information about a provider plugin, i.e. AWS. There are various tiers of providers: official, partner, and community.  
- **Resources** are what is created within a target environment, i.e. a VM or a database
- **Data sources** are ways to query information from a provider.


