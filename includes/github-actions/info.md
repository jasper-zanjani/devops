Github Actions (1) is Github's integrated CI/CD solution.
YAML-format _workflow_ files are placed in the repo's **.github/workflows** directory.
{: .annotate }

1.  

    --8<-- "includes/github-actions/callout.md"

The following example is the simplest possible workflow.


-   [`on`](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#on) defines the events that cause the workflow to run.
    Unlike in ADO where the keyword `trigger: none` can be used in the same way to enable only manually run jobs, GitHub requires at least one job. (1)
    {: .annotate }

    1.  
        ```yaml title="ado/00"
        --8<-- "includes/ado/00/pipeline.yml"
        ```

-   [`workflow_dispatch`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#workflow_dispatch) is used to manually 

-   Unlike in ADO, where the identifier of the job is value to the `job` key, the [name of the child of `job` is itself the identifier](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_iduses) which can take an optional `name` setting.
    It appears that the implicit single-job style in ADO is not possible. (1)
    {: .annotate }

    1.  

        ```yaml title="ado/01"
        --8<-- "includes/ado/01/pipeline.yml"
        ```

-   [`uses`](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_iduses) specifies the location and version of a reusable workflow file to run as a job.

-   Note that in order to push a commit, the token must have read and write permissions for the workflows scope.

```yaml title="github-actions/00"
--8<-- "includes/github-actions/00/test.yml"
```

This elaborated example publishes a release to the Releases page of the repo

-   [`env`](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepsenv) sets environment variables, and here it sets the 


```yaml title="github-actions/01"
--8<-- "includes/github-actions/01/build.yml"
```
