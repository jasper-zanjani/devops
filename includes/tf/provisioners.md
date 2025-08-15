# Provisioners

**Provisioners** model specific actions in order to prepare servers or other infrastructure objects for service.
Provisioners are described as a last resort in Terraform documentation because their actions cannot be modeled as part of a plan.

[**local-exec**](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) invokes a local executable.

```terraform
provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
}
```

There is also a [null resource provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)
