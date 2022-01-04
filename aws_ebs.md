# AWS Elastic Block Store

**EBS 101**

- Elastic Block Store
- Each Amazon EBS volume is automatically replicated within its AZ to protect you from component failure
- 5 types
    - **gp2** - General purpose SSD - most workloads
    - **io1** - Provisioned IOPS (SSD) - dbs / highest performance / mission critical apps / 64k IOPS
    - **st1** -Throughput optimized HDD - magnetic - big data and data warehouses
    - **sc1** - Cold HDD - file servers / lowest cost HDD vol
    - **Standard** - Magnetic - previous gen HDD / infrequently accessed data

**EBS Volumes & Snapshots**

- Snapshots take a while
- Can create image from EBS snapshot
    - Different virtualization types available
        - Paravirtual (PV)
        - Hardware vritual machine (HVM) - default - gives more EC2 instance options
- Volumes exist on EBS
- Snapshots exist on S3
- Snapshots are point in time copies of volumes
- Snapshots are incremental - only changes are replicated to S3
- To take a snapshot of a root device - best practice to stop the ec2 instance to stop first
- Can create AMI from Snapshot
- Can change EBS volume sizes on the fly
- Volumes will always be in the same AZ as the EC2 instance
