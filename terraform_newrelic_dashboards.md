# New Relic dashboards via Terraform
New Relic dashboards can be defined in terraform, either directly inline or by referencing a json file.

e.g. the dashboard resource would look like this:

```hcl
resource "newrelic_one_dashboard_json" "prefect_jobs_dashboard" {
   json = file("dashboard.json")
}
```

The `dashboard.json` file needs to have all the settings and queries needed to fully define the New Relic dashboard.

Below is an example json definition of one of my dashboards:

```json
{
  "name": "Prefect Jobs Dashboard",
  "description": null,
  "permissions": "PUBLIC_READ_WRITE",
  "pages": [
    {
      "name": "Prod Job Errors",
      "description": null,
      "widgets": [
        {
          "title": "Prod Image Pull Backoffs",
          "layout": {
            "column": 1,
            "row": 1,
            "width": 4,
            "height": 3
          },
          "linkedEntityGuids": null,
          "visualization": {
            "id": "viz.stacked-bar"
          },
          "rawConfiguration": {
            "facet": {
              "showOtherSeries": false
            },
            "legend": {
              "enabled": true
            },
            "nrqlQueries": [
              {
                "accountIds": [
                  1962024
                ],
                "query": "SELECT COUNT(*) FROM InfrastructureEvent SINCE 3 MONTHS AGO WHERE clusterName LIKE '%k8s%' AND event.involvedObject.namespace LIKE '%ns-flows-Prod%' AND event.type NOT LIKE '%Warning%' AND event.involvedObject.kind IN ('Pod', 'Job') AND event.message LIKE '%Back-off pulling image%' AND event.metadata.name LIKE '%prefect-job%' TIMESERIES WEEK"
              }
            ],
            "platformOptions": {
              "ignoreTimeRange": false
            }
          }
        },
        {
          "title": "Prod Pod Scaledowns",
          "layout": {
            "column": 5,
            "row": 1,
            "width": 4,
            "height": 3
          },
          "linkedEntityGuids": null,
          "visualization": {
            "id": "viz.stacked-bar"
          },
          "rawConfiguration": {
            "facet": {
              "showOtherSeries": false
            },
            "legend": {
              "enabled": true
            },
            "nrqlQueries": [
              {
                "accountIds": [
                  1962024
                ],
                "query": "SELECT COUNT(*)\nFROM InfrastructureEvent \nSINCE 3 MONTHS AGO \nWHERE clusterName LIKE '%k8s%' \nAND event.involvedObject.namespace LIKE '%ns-flows-Prod%' \nAND event.involvedObject.kind IN ('Pod', 'Job') \nAND event.reason IN ('ScaleDown')\nAND event.metadata.name LIKE '%prefect-job%' \nTIMESERIES WEEK"
              }
            ],
            "platformOptions": {
              "ignoreTimeRange": false
            }
          }
        },
        {
          "title": "Prod Pod Killing Events",
          "layout": {
            "column": 9,
            "row": 1,
            "width": 4,
            "height": 3
          },
          "linkedEntityGuids": null,
          "visualization": {
            "id": "viz.stacked-bar"
          },
          "rawConfiguration": {
            "facet": {
              "showOtherSeries": false
            },
            "legend": {
              "enabled": true
            },
            "nrqlQueries": [
              {
                "accountIds": [
                  1962024
                ],
                "query": "SELECT COUNT(*)\nFROM InfrastructureEvent \nSINCE 3 MONTHS AGO \nWHERE clusterName LIKE '%k8s%' \nAND event.involvedObject.namespace LIKE '%ns-flows-Prod%' \nAND event.type NOT LIKE '%Warning%' \nAND event.involvedObject.kind IN ('Pod', 'Job') \nAND event.reason IN ('Killing')\nAND event.metadata.name LIKE '%prefect-job%' \nTIMESERIES WEEK\n"
              }
            ],
            "platformOptions": {
              "ignoreTimeRange": false
            }
          }
        },
        {
          "title": "Scaledown Events",
          "layout": {
            "column": 5,
            "row": 4,
            "width": 4,
            "height": 3
          },
          "linkedEntityGuids": null,
          "visualization": {
            "id": "viz.table"
          },
          "rawConfiguration": {
            "facet": {
              "showOtherSeries": false
            },
            "nrqlQueries": [
              {
                "accountIds": [
                  1962024
                ],
                "query": "SELECT event.involvedObject.name, event.message, event.lastTimestamp\nFROM InfrastructureEvent \nSINCE 3 MONTH AGO \nWHERE clusterName LIKE '%k8s%' \nAND event.involvedObject.namespace LIKE '%ns-flows-Prod%' \nAND event.involvedObject.kind IN ('Pod', 'Job') \nAND event.reason IN ('ScaleDown')\nAND event.metadata.name LIKE '%prefect-job%' \n"
              }
            ],
            "platformOptions": {
              "ignoreTimeRange": false
            }
          }
        }
      ]
    }  
  ],
  "variables": []
}
```