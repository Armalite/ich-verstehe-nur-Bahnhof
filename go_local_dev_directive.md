# Setting Local Developer Directive in Go
In Go you can set a directive in go.mod that replaces specific imports during development.

e.g. The following directive repoints any imports of the Prefect terraform provider folder to instead use the local instance of it
```
replace github.com/prefecthq/terraform-provider-prefect => /Users/adeeb.rahman/Documents/dev/personal/terraform-provider-prefect
```