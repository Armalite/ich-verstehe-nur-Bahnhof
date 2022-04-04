# Atlantis Custom Workflow Steps
You can use `run: ` to specify custom step executions in your atlantis workflow.

```
version: 3
projects:
- name: myproject
  dir: myproject
  workflow: atlantis

workflows:
  atlantis:
    plan:
      steps:
      - run: terraform init -reconfigure -backend-config dev.conf
      - run: terraform plan -var-file vars-prod.tfvars -out $PLANFILE
```