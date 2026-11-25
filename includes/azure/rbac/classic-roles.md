When Azure was first released, access to resources was managed with just three administrator roles:

- **Account Administrator**
- **Service Administrator**
- **Co-Administrator**

Use of these legacy roles to manage access is referred to as "classic administration" because it pre-dates the introduction of Azure RBAC, which is preferred.
Classic subscription administrators have full access to a subcription. 
They can access resources through Azure Portal, ARM APIs (PowerShell and CLI), and classic deployment model APIs.

By default, the account that is used to sign up for a subscription is automatically set as both Account Administrator and Service Administrator. 

There can only be one Account Administrator per account and only 1 Service Administrator per subscription. 

Co-Administrators have the same access as Service Administrators, and there can be 200 of them per subscription, but cannot change the association of subscriptions to directories.

Current assignments for classic admins can be seen in the **Properties blade** of a subscription in Azure Portal.
Co-Administrator assignments can be added by opening the **Access Control (IAM)** blade of a subscription, then clicking the **Add co-administrator** button.
