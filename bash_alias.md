# Bash aliases

Set aliases to set specific versions of packages to be called for bash commands

Example:
```Bash
alias python3=python3.9
alias pip3='python3.9 -m pip'
alias pip=pip3
```

 - Sets `python3` to use the python3.9 installation (instead of, for example, python3.8 if that is also installed)
 - Sets `pip3` to use the pip installation that is in the python3.9 installation (instead of, for example, the pip instalalation that sits within the python3.8 installation)
 - Sets `pip` to call `pip3` 
