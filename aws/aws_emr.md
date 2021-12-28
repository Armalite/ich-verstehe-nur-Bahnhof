**EMR**

- Process vast amounts of data using open source tools (Spark, Hive etc.)
- Cluster = group of ec2 instance
- Each node a role
- Master node
- Core node
- Task node
- S3 storage - must be set up when creating the cluster

```bash
aws emr create-cluster \
    --release-label emr-5.14.0 \
    --service-role EMR_DefaultRole \
    --ec2-attributes InstanceProfile=EMR_EC2_DefaultRole \
    --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m4.large InstanceGroupType=CORE,InstanceCount=2,InstanceType=m4.large
```
