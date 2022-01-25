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


If you wish to provision a resource based on whether a variable has been set to null or not (i.e. dont provision if null), then make use of the 'count' function of terraform:

```hcl
resource "aws_ec2" "beautiful_ec2_instance" {
  count = var.my_object_var != null ? 1 : 0
  # ...
}
```
The above example sets the `count` to 1 if the variable is not null, which causes terraform to provision it. If the variable is null, the `count` gets set to 0, and the resource is not provisioned.
Keep in mind that if you use `count` inside a resource, whenever you reference this resource you will need to access it via a list by the first instance of a list. e.g. based on the ec2 instance specified in the above example, you would access this instance as such:

```hcl
resource "some_resource" "some_resource_name" {

  ec2_id = aws_ec2.beautiful_ec2_instance[0].id
  # ...
}
```
