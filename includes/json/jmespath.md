JMESPath (1) is a query language for JSON
{: .annotate }

1.  === "References"

        -   [JMESPath tutorial](https://jmespath.org/tutorial.html)



_Projections_ are a class of JMESPath expression that obtain the value of one or more keys in a JSON document.

-   The simplest expression is an _identifier_ which selects a key in a JSON document.
-   [_List/slice projections_](https://jmespath.org/tutorial.html#list-and-slice-projections) use a syntax if indices within square brackets to select items from an array (i.e. `[*]`, `[0]`, `[1:2]`, `[3:]`, etc)
-   [_Filter projections_](https://jmespath.org/tutorial.html#filter-projections)
    Note that the right-hand side of filter expressions requires the use of single quotes, so the entire expression should be double-quoted.

[_MultiSelect_ expressions](https://jmespath.org/tutorial.html#multiselect) allow you to reassemble a JSON document from multiple disparate keys.

-   Multiselect hash creates a hash instead of an array.

--8<-- "includes/json/jq-jp.md"
