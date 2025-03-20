Virtual Private Cloud infrastructure service

=== "subnet"

    ```sh
    # List subnets
    ibmcloud is subnets

    # Create subnet
    ibmcloud is subnet-create
    ```

=== "vpc"

    ```sh
    ibmcloud is vpcs

    ibmcloud is vpc-create --address-prefix-management auto

    # List address prefixes of a VPC
    ibmcloud is vpc-addrs $VPC
    ```


