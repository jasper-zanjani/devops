Virtual Private Cloud infrastructure service

=== "keys"

    ```sh
    ibmcloud is keys

    # Takes text of public key by default, but can be passed a filename by prepending with @
    ibmcloud is key-create $KEY_NAME "@$KEY_PATH"
    ```

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


