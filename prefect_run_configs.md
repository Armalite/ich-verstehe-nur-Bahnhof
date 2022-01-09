# Prefect RunConfigs

Determines how to execute a flow. Using this a runconfig can be set based on a local run vs. a k8s run on a remote cluster.

Basic run config declaration

```python
from prefect import Flow
from prefect.run_configs import KubernetesRun

# part of the constructor
with Flow("example", run_config=KubernetesRun()) as flow:
    print("This is my flow")

# or set it later
with Flow("example") as flow:
    print("This is my flow")

flow.run_config = KubernetesRun()
```

A function that returns a run config to set for flows
```python
def set_run_config(local: bool = False) -> RunConfig:
    if local:
        return LocalRun(labels=["dev"])
    aws_account_id = Secret("AWS_ACCOUNT_ID").get()
    return KubernetesRun(
        labels=["prod"],
        image=f"{aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/prefect-dbt-k8s-snowflake:latest",
        image_pull_policy="IfNotPresent",
    )
```

The above function can be called in a flow constructor as such:
```python
with Flow(FLOW_NAME,
          storage=set_storage(FLOW_NAME),
          run_config=set_run_config(),
          ) as flow:
```
