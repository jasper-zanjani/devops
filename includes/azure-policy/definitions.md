An Azure Policy [**definition**](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-basics) defines resource compliance conditions and the **effect** to take if a condition is met.

The heart of the policy definition is the [**policy rule**](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-policy-rule) which consists of `if` and `then` blocks that define compliance conditions and an effect, respectively.

Every policy definition has a single [**effect**](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/effects). (1)
{: .annotate }

1.  Policy effects:

    - `audit`
    - `modify`
    - `append`
    - `auditIfNotExists`
    - `deny`
    - `deployIfNotExists`
    - `disabled`

    The order of evaluation of effects is: Disabled, Append, Deny, Audit ("DADA")

Policy definitions are packaged together are packaged together into **initiatives**, which are further composed of initiative definitions and initiative assignments.
These initiatives are what is listed under Policy > Compliance.
