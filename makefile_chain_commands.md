# Chaining Commands in Make Target

You can chain bash commands inside a Make target by separating with `;` . In these cases, new lines will need escaping with `\`.

For example, within a make target you can change directory before running a command relative to the changed directory. If you had a virtual environment in the current directory, and a dbt project in the 'dbt' directory, and wished to run a dbt command (e.g. `dbt deps` to install packages) using the venv dbt installation, but from within the dbt directory:

```bash
cd dbt; ../$(venv)/bin/dbt deps

```
This changes to the dbt dir, then runs dbt deps using the dbt installation located in the venv, which exists in the parent dir.
