HashiCorp recommends [creating](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret?product_intent=terraform#creating-a-service-principal-using-the-azure-cli) a service principal and assigning key environment variables in order to get access to the Azure provider.
[Alternatively,](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#configuring-azure-cli-authentication-in-terraform) the subscription ID can be provided directly as a variable, or the `ARM_SUBSCRIPTIOIN_ID` environment variable can be set.

```terraform title="Authentication with environment variables"
--8<-- "includes/tf/azurerm/main.tf"
```

