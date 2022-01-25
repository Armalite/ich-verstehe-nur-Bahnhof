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

If you have a variable of type object, and wish to have optional fields within this object, you can use the experimental optional() declaration within the variable:
```hcl
variable my_object_var {

  description = "A variable containing a list of strings"
  type        = object({
      name = optional(string)
  })

}
```

In the above example, the name field of the variable object is optional. The variable itself, however, is still required. If you wish the variable to also be optional, since this is an object you will need to set its default to null, i.e. `default = null`. You will then need to check for null in resources that utilize this variable.
