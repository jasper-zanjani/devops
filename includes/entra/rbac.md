Microsoft Entra has its own system of [role-based access control](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/custom-overview) which applies to Entra resources.
Like Azure RBAC, Microsoft Entra RBAC works by assigning a role definition to a security principal at a specified scope.

- **Global Administrator** can manage access to administrative features in AAD and can grant administrator roles to other users. An AAD Global Administrator **can also [temporarily elevate](RBAC#elevate-permissions) their own access to the Azure RBAC role of User Access Administrator in order to manage all Azure subscriptions and management groups**. Whoever signs up for the directory is automatically assigned this role.

- Device administrator

