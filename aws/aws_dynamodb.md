**DynamoDB**

- Dynamo DBAccelerator (DAX)
    - 10x performance improvement
    - In memory cache, fully manage, highly available
    - Compatible with existing DynamoDB API calls
    - Developers dont need to manage the cache
    - Has write-through cache
- Transactions
    - All or nothing oiperations
    - financial transactions
    - Fulfilling orders
    - 25 items at any time
- On demand backup and restore
    - Full backups at anytime
    - Zero impact on table performance
    - Consistent within seconds, retained until deleted
    - Same region
- Point in time recovery (PITR)
    - Protects aginst accidental writes or deletes
    - 35 days to restrore
    - Incremental backups
    - Not enabled by default
- Streams
    - Time ordered sequence of item level changes in a table
    - Stored for 24 hours
    - Insert updates and deletes
    - Combine with lambda functions to achieve something like stored procedures
- Global tables
    - globally distributed apps
    - Super fast cross region replication
- Database migration service (DMS)
- Security
    - All data is encrypted at rest
    - site to site VPN
    - Direct connect
    - IAM policies and roles
    - VPC endpoints

**Aurora**

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

**Elasticache**

- Web service that makes it easy to deploy operate and scale an in memory cache in the cloud
- Fast - doesnt have to go to db to get info
- memcached / redis
- redis = no multithreaded performance, but good if you need backup restore and multi-az stuff
- Caching engine
- *You should store session in dynamodb* - shares user cached metadata across instances

**DMS - Database Migration Service**

- homogenous vs heterogenous migrations
- SCT = schema conversion tool

**EMR**

- Process vast amounts of data using open source tools (Spark, Hive etc.)
- Cluster = group of ec2 instance
- Each node a role
- Master node
- Core node
- Task node
- S3 storage - must be set up when creating the cluster