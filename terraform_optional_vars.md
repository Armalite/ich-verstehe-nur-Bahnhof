# Terraform Optional Variables

Optional variables can be set in various ways in terraform. One way is by specifying a empty default value, or a null value and doing null checks in other resources, though that adds more complexity.

For example, specifying an empty list as the default for a variable that accepts a list of strings:
```hcl
variable my_list_var {

  description = "A variable containing a list of strings"
  type        = list(string)
  default     = []

}
```
