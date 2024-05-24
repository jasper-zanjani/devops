# IAM

IAM works at the Global level, and is not effective against specific regions.


The root account is the email address used to sign up for AWS, which has full administrative access to AWS.

**Policy documents** are JSON objects that define IAM permissions for principals or roles.
The following JSON policy document describes unlimited access to all resource types, and is the output provided by the AWS-managed AdministratorAccess IAM policy.

```json title="Policy document"
--8<-- "includes/Policy/everything.json"
```

**Identity Providers** allow connections to solutions like Active Directory.

An IAM role is an identity with specific permission policies.
Instead of being uniquely and permanently associated with a single person, a role can be temporarily assumed by anyone who needs to use it.
Roles can be assumed by people, AWS resources, or other system-level accounts.



Resources:

- [AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)

#### ARN

In addition to the friendly names provided to resources, the permissions policy language requires resources to be specified using the [**Amazon Resource Name (ARN)**](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html) format.

``` title="ARN format"
arn:partition:service:region:account-id:resource-id
```

```sh hl_lines="3 9" title="Commands requiring an ARN"
# Note that only hardware MFA devices are supported with this API
aws iam get-mfa-device \
    --serial-number 'arn:aws:iam::123456789012:mfa/Device'

# Note that "aws" is provided as the account ID for AWS managed policies, 
# and there is no region specified because the resource is global.
aws iam attach-group-policy \
    --group-name Admins \
    --policy-arn 'arn:aws:iam::aws:policy/AdministratorAccess'
```

### Tasks

<div class="grid cards" markdown>

-   #### IAM user and group

    ---

    --8<-- "includes/Tasks/aws/aws-iam-create-user.md"

-   #### Create administrator

    ---

    ```sh
    aws iam create-access-key --user-name $USER
    ```

</div>

