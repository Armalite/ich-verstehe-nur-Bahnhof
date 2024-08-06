# Golang Pointer and Value receivers
 - Associating Methods with Types:
   - The receiver allows you to associate a method with a specific type, either a struct or a named type. This makes the function a method that can be called on instances of that type.
   - For example, with func (r *ServiceAccountResource) Configure(...), Configure is a method that can be called on any instance of ServiceAccountResource.
 - Accessing Instance Data:
   - The receiver gives you access to the fields and methods of the instance it is called on, much like self in Python.
   - If ServiceAccountResource has fields, within the Configure method, you can access them using r.
 - Pointer vs Value Receivers:
   - A receiver can be either a value or a pointer. This choice has significant implications:
   - Value Receiver: A copy of the type is passed to the method. Modifications to the receiver inside the method do not affect the original instance.
   - Pointer Receiver: A pointer to the type is passed to the method. Modifications to the receiver inside the method will affect the original instance.
   - For example, func (r ServiceAccountResource) Configure(...) would use a value receiver, while func (r *ServiceAccountResource) Configure(...) uses a pointer receiver. The latter is more common when the method needs to modify the instance or avoid copying large structs.
 - Method Sets:
   - The receiver type determines the method set, which is the set of methods that are available to a type. Methods with pointer receivers belong to the method set of both the pointer and the value type, whereas methods with value receivers belong only to the value type.

## Example

```Go
package main

import "fmt"

// Define a struct type
type ServiceAccountResource struct {
    client string
}

// Define a method with a pointer receiver
func (r *ServiceAccountResource) Configure(client string) {
    r.client = client // This modifies the original instance
}

// Define a method with a value receiver
func (r ServiceAccountResource) Display() {
    fmt.Println("Client:", r.client) // This only accesses a copy of the instance
}

func main() {
    var res ServiceAccountResource
    
    res.Configure("ExampleClient")
    res.Display() // Output: Client: ExampleClient

    copy := res
    copy.Configure("NewClient")
    res.Display() // Output: Client: ExampleClient (original instance remains unchanged)
}

```
