# EC2

**Elastic Compute Cloud**

**Security groups** define permissible network communications in a VPS and are equivalent to firewalls in physical networks.

**Bootstrap scripts** are run when an instance boots for the first time and allow for the automated installation of applications.

### Tasks

<div class="grid cards" markdown>

-   #### Create instance

    ---

    ```sh
    aws ec2 run-instances --image-id $AMI
    ```

-   #### Metadata

    ---

    Metadata can be retrieved from within the instance by curling 169.254.169.254:

    ```sh
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
    ```

    Resources:

    - [EC2 metadata and user data](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/export-credentials.html "PluralSight: AWS Certified Solutions Architect - Associate (SAA-C03) - EC2 metadata and user data")

</div>