[**Entra ID**](https://learn.microsoft.com/en-us/entra/fundamentals/whatis) (formerly Azure Active Directory) functions as Azure's **identity provider**. (1)
{: .annotate }

1.  

    --8<-- "includes/cloud/idp.md"

A **tenant** refers to an instance of Entra that is tied to a subscription, and refers to the organization.
Each tenant is associated with a dedicated and trusted **directory** that includes the tenant's users, groups, and apps.

**Business-to-business (B2B)** collaboration allows you to invite **guest users** into your own ([What is guest user access in Microsoft Entra B2B?](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/what-is-b2b))


#### Licensing

??? tip

    - [Licenses](https://learn.microsoft.com/en-us/entra/fundamentals/whatis#what-are-the-microsoft-entra-id-licenses)
    - [Assign or remove licenses in the Azure Active Directory Portal](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/license-users-groups)
    - [Configure Microsoft 365 user account properties with PowerShell](https://docs.microsoft.com/en-us/microsoft-365/enterprise/configure-user-account-properties-with-microsoft-365-powershell?view=o365-worldwide)



- Microsoft Entra ID Free
- Microsoft Entra ID P1
- Microsoft Entra ID P2 
    - [Microsoft Entra ID Protection](https://learn.microsoft.com/en-us/entra/id-protection/overview-identity-protection)
    - [Privileged Identity Management](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started)


Note: The user to be licensed must first have a **Usage location** set.

Use the ISO 3166-1 A2 two-letter country or region code to set this value in PowerShell

```powershell
Set-AzureADUser -UsageLocation 'US'
```

#### Roles

Entra has its own set of roles which apply to Entra resources and which are distinct from those of Azure RBAC which govern Azure resources.

- **Global Administrator** can manage access to administrative features in AAD and can grant administrator roles to other users. An AAD Global Administrator **can also [temporarily elevate](RBAC#elevate-permissions) their own access to the Azure RBAC role of User Access Administrator in order to manage all Azure subscriptions and management groups**. Whoever signs up for the directory is automatically assigned this role.

- Device administrator

#### Features

[**Enterprise State Roaming**](https://learn.microsoft.com/en-us/entra/identity/devices/enterprise-state-roaming-enable) allows users to securely synchronize user settings and application settings to Azure.
It is required for Entra users to be able to change their password on-prem or in the clooud.

