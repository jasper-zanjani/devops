Azure Blob Storage can be used to host static web apps. (1)
I was able to deploy a static web app from the Portal but not using the Azure CLI.
GitHub Mobile refused to display the verification code I was being demanded to produce by the browser window.
I am also not familiar with how to provide a token inline.
{: .annotate }

1.  

    -   [Authenticate and authorize Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/authentication-authorization)

    -   [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)



```sh
--8<-- "includes/Commands/a/az-staticwebapp.sh"
```

The process of deploying to Azure also appears to depend on a GitHub workflow file, which I haven't had time to get into yet.
