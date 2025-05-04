#### Self-service password reset

**Self-Service Password Reset (SSPR)** is supported for all users. 
SSPR registration can be configured by group or for all domain users, but **not** individual users.

Administrator accounts are treated differently from other user accounts for SSPR and have a "strong default **two-gate** password reset policy", which requires two pieces of authentication data and foregoes the use of security questions.

#### Bulk user creation

Users can be [imported](https://learn.microsoft.com/en-us/entra/identity/users/groups-bulk-import-members) or [created](https://learn.microsoft.com/en-us/entra/identity/users/users-bulk-add) in bulk using CSV files.

#### Joining a device

When you join a device to an Azure AD tenant's domain, Azure AD creates local administrator accounts on the device for:

- The user joining the device
- The Azure AD global administrator
- The Azure AD device administrator

#### Enable MFA

User sign-in can be [secured](https://learn.microsoft.com/en-in/entra/identity/authentication/tutorial-enable-azure-mfa#create-a-conditional-access-policy) with Microsoft Entra multifactor authentication.

- [Create a **Conditional Access policy**](https://learn.microsoft.com/en-in/entra/identity/authentication/tutorial-enable-azure-mfa#create-a-conditional-access-policy) to enforce MFA with specified users.

- [Tutorial: Secure user sign-in events with Azure Multi-Factor Authentication](https://docs.microsoft.com/en-in/azure/active-directory/authentication/tutorial-enable-azure-mfa)
- [How to manage the local administrators group on Azure AD joined devices](https://docs.microsoft.com/en-us/azure/active-directory/devices/assign-local-admin)
- [Password policies and account restrictions in Azure AD](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-policy#administrator-reset-policy-differences)
