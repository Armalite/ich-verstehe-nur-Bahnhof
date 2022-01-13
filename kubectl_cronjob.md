# Kubectl Cronjob

  - Create a cronjob using Kubectl, from an existing Cronjob spec (yaml file):
  ```bash
  kubectl create -f https://k8s.io/examples/application/job/cronjob.yaml
  ```
  - View CronJob details using Kubectl:
  ```bash
  kubectl get cronjob hello
  ```
  - Delete a CronJob using Kubectl:
  ```bash
  kubectl delete cronjob hello
  ```
