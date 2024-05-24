=== ":material-aws: AWS CLI"

    ```sh
    aws iam create-user \
        --user-name Bob
    
    aws iam create-group \
        --group-name Admins \

    # Confirm
    aws iam list-users
    aws iam list-groups

    aws iam add-user-to-group \
        --group-name Admins \
        --user-name Bob

    # Confirm
    aws iam list-groups-for-user \
        --user-name Bob

    aws iam attach-group-policy \
        --group-name Admins \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

    # Confirm
    aws iam list-attached-group-policies \
        --group-name Admins
    ```

=== ":material-terraform: Terraform"

    ```terraform
    --8<-- "includes/tf/aws-iam.tf"
    ```