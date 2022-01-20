# Prefect Kubernetes Tasks

There are a number of Kubernetes tasks available within Prefect.

You can define k8s jobs straight from yaml specs and run these jobs in a k8s namespace:
```python
import prefect
from prefect import task, Flow
from prefect.tasks.kubernetes import RunNamespacedJob
import yaml

job_template = open('kube/test_cronjob.yaml')
job_template_dict = yaml.load(job_template)

k8s_job_run_task = RunNamespacedJob(body=job_template_dict)
```
