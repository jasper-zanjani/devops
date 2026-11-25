[**Azure role-based access controls**](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview) (RBAC) governs access to Azure resources. 
These are similar to, but [distinct](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles), from Microsoft Entra roles

RBAC works by creating a role assignment that associates a role definition, a security principal, and a scope.
Components of a role assignment include:

-   **Security principal**: objects associated with a role definition and a scope to apply RBAC to azure resources (i.e. users, groups, service principals, or [managed identities](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/overview)).
-   [**Role definition**](#role-definition): list of permissions which define what actions can or cannot be performed against a resource.
    There are many built-in roles and custom roles can be defined using a JSON file.
-   [**Scope**](#scopes): There are four scopes at which roles can be assigned: management groups, subscriptions, resource groups, or resources.
    Child resources inherit the roles of their parents (role inheritance).

Some built-in roles:

- **Owner** has full access to all resources and can delegate access. Service Administrator and Co-Administrators are assigned this role at the subscription scope.
- **Contributor** can create and manage all resources (full read/write privileges), but **cannot** delegate access.
- **Reader** can view resources.
- [Cost Management Contributor][Cost Management Contributor]
- [Cost Management Reader][Cost Management Reader]
- [Resource Policy Contributor][Resource Policy Contributor]
- [User Administrator][User Administrator]
- [User Access Administrator][User Access Administrator]

??? info "Custom role definitions"

    Custom roles configure two types of privileges and are specified by two different properties of the definition JSON file: `Management` and `Data`.
    This provides safety from allowing unrestricted access to data.

    The values of these properties is an array of strings, each of which follows the format `Company.ProviderName/ResourceType/Action` where `action` can be of values `read`, `write`, `action`, `delete`, or `*`.

    | Privilege      | Allow permissions | Deny permissions |
    | -------------- | ----------------- | ---------------- |
    | **Management** | `Actions`         | `NotActions`     |
    | **Data**       | `DataActions`     | `NotDataActions` |

    <div class="grid cards" markdown>

    ```json title="Unrestricted"
    "Actions": [
      "*"
    ]
    ```


    ```json title="Read only network resources"
    "Actions": [
      "Microsoft.Network/*/read"
    ]
    ```

    </div>

    Example role definitions:

    === "Contributor"

        ```json
        {
          "Name": "Contributor",
          "Id": "b24988ac-6180-42a0-ab88-20f7382dd24c",
          "IsCustom": false,
          "Description": "Lets you manage everything except access to resources.",
          "Actions": [
            "*"
          ],
          "NotActions": [
            "Microsoft.Authorization/*/Delete",
            "Microsoft.Authorization/*/Write",
            "Microsoft.Authorization/elevateAccess/Action",
            "Microsoft.Blueprint/blueprintAssignments/write",
            "Microsoft.Blueprint/blueprintAssignments/delete"
          ],
          "DataActions": [],
          "NotDataActions": [],
          "AssignableScopes": [
            "/"
          ]
        }
        ```

