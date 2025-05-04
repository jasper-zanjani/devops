Azure Policy is a service that can create, assign, and manage policies to enforce governance. 
RBAC roles deny by default and allow explicitly, but Azure Policy allows by default and denies explicitly.

To implement policy, a policy definition is created first, then a policy assignment assigns it to a scope, which can be a management group, subscription, or resource group with all child resources and resource groups being affected.

```sh
--8<-- "includes/cmd/az/az-policy.sh"
```

Policy definitions can be packaged together using **initiative definitions** and applied to a scope using **initiative assignments**.

Every policy definition has a single [effect](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/effects), which includes:

- Audit: create a warning event in the log
- Modify: used to add, update, or remove properties or tags on a resource during creation or update.
- Append
- AuditIfNotExists
- Deny
- DeployIfNotExists
- Disabled

The order of evaluation of effects is: Disabled, Append, Deny, Audit ("DADA")
