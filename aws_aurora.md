# AWS Aurora

- 5x performance compared to MySQL, 3x to PostGres
- 2 copies of data across 3 AZ. 6 copies in total
- 15 Amazon Aurora replicas
- Aurora: in region
- No data loss during failover
- Instant replication / low delay
- Automated backups always enabled, does not impact performance
- Can take snapshots of Aurora - does not impact performance (can share with other aws accounts too)
- Amazon Aurora Serverless - on-demand, autoscaling
    - mysql, postgres compatible
    - Cost-effective option for infrequent, intermittent or unpredictable workloads
