# Python Virtual Environments

## Creating a Python venv
Use default system python to create a venv:
```bash
    python -m venv --clear .venv
    .venv/bin/python --version
```

## Using a specific version of Python
If you're on Ubuntu you might need to install the venv package for your Python version e.g. `3.10-venv`:
```bash
    sudo apt install python3.10-venv
```

You can then use the new version to create your venv:

```bash
    python3.10 -m venv --clear .venv
    .venv/bin/python3.10 --version
```