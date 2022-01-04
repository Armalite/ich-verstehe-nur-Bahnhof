## Prefect Triggers

Trigger a flow based on a state or state change of another flow. e.g. when all upstream tasks have succeeded. Can also use other state conditionals e.g. 'any upstream task succeeds' --> Many available [functions](https://docs.prefect.io/api/latest/triggers.html#functions) for this. The `flow.set_reference_tasks()` function sets the success task to the reference task below to repesent the overall state of the flow
```python
@task(name="My Parent Task")
def task_parent():
    if random.random() > 0.5:
        raise ValueError("Non-deterministic error has occured.")

@task(name="Success Task", trigger=all_successful)
def task_success():
    # do something interesting
    pass

@task(name="Failure Task", trigger=all_failed)
def task_fail():
    # do something interesting
    pass


with Flow("Trigger example") as flow:
    success = task_success(upstream_tasks=[task_a])
    fail = task_fail(upstream_tasks=[task_a])
	flow.set_reference_tasks([success])
```
