### Entra ID

[**Entra ID**](https://learn.microsoft.com/en-us/entra/fundamentals/whatis) (formerly Azure Active Directory) has its own set of roles which apply to Azure AD resources and which are distinct from those of Azure [RBAC](#iam).

A **tenant** refers to an instance of Azure AD that is tied to a subscription, and refers to the organization.
Each tenant is associated with a dedicated and trusted **directory** that includes the tenant's users, groups, and apps.

<div class="grid cards" markdown>

-   #### [Licenses](https://learn.microsoft.com/en-us/entra/fundamentals/whatis#what-are-the-microsoft-entra-id-licenses)

    ---

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

    ---

    - [Assign or remove licenses in the Azure Active Directory Portal](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/license-users-groups)
    - [Configure Microsoft 365 user account properties with PowerShell](https://docs.microsoft.com/en-us/microsoft-365/enterprise/configure-user-account-properties-with-microsoft-365-powershell?view=o365-worldwide)

-   #### Roles

    - **Global Administrator** can manage access to administrative features in AAD and can grant administrator roles to other users. An AAD Global Administrator **can also [temporarily elevate](RBAC#elevate-permissions) their own access to the Azure RBAC role of User Access Administrator in order to manage all Azure subscriptions and management groups**. Whoever signs up for the directory is automatically assigned this role.

    - Device administrator

-   #### Features

    - [**Enterprise State Roaming**](https://learn.microsoft.com/en-us/entra/identity/devices/enterprise-state-roaming-enable) allows users to securely synchronize user settings and application settings to Azure.
        - required for AD users to be able to change their password on-prem or in the clooud.

-   #### Tasks

    ??? info "Self-service password reset"

        **Self-Service Password Reset (SSPR)** is supported for all users. 
        SSPR registration can be configured by group or for all domain users, but **not** individual users.

        Administrator accounts are treated differently from other user accounts for SSPR and have a "strong default **two-gate** password reset policy", which requires two pieces of authentication data and foregoes the use of security questions.

    ??? info "Bulk user creation"

        Users can be [imported](https://learn.microsoft.com/en-us/entra/identity/users/groups-bulk-import-members) or [created](https://learn.microsoft.com/en-us/entra/identity/users/users-bulk-add) in bulk using CSV files.

    ??? info "Joining a device"

        When you join a device to an Azure AD tenant's domain, Azure AD creates local administrator accounts on the device for:

        - The user joining the device
        - The Azure AD global administrator
        - The Azure AD device administrator

    ??? info "Enable MFA"

        User sign-in can be [secured](https://learn.microsoft.com/en-in/entra/identity/authentication/tutorial-enable-azure-mfa#create-a-conditional-access-policy) with Microsoft Entra multifactor authentication.

        - [Create a **Conditional Access policy**](https://learn.microsoft.com/en-in/entra/identity/authentication/tutorial-enable-azure-mfa#create-a-conditional-access-policy) to enforce MFA with specified users.

        ---

        - [Tutorial: Secure user sign-in events with Azure Multi-Factor Authentication](https://docs.microsoft.com/en-in/azure/active-directory/authentication/tutorial-enable-azure-mfa)
        - [How to manage the local administrators group on Azure AD joined devices](https://docs.microsoft.com/en-us/azure/active-directory/devices/assign-local-admin)
        - [Password policies and account restrictions in Azure AD](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-policy#administrator-reset-policy-differences)
</div>


Roles:





## B2B

**Business-to-business (B2B)** collaboration allows you to invite **guest users** into your own ([What is guest user access in Azure Active Directory B2B?](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/what-is-b2b))
