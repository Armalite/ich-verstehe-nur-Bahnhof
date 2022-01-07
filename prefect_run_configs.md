# Prefect RunConfigs

Using this a runconfig can be set based on a local run vs. a k8s run on a remote cluster. Any changes to the type of run can be addressed directly in this config function for future changes.

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

This can be called in a flow constructor as such:

```python
with Flow(FLOW_NAME,
          storage=set_storage(FLOW_NAME),
          run_config=set_run_config(),
          ) as flow:
```
