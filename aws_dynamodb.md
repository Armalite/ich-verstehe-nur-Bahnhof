# AWS DynamoDB

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

 - Create table
 ```bash
 aws dynamodb create-table \
    --table-name MusicCollection \
    --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --tags Key=Owner,Value=blueTeam
 ```


  - Retrieve an item from the MusicCollection table. The table has hash and range PK (Artist and SongTitle), so both attributes need to be specified. Also output read capacity consumed by the operation.
  ```bash
   aws dynamodb get-item \
       --table-name MusicCollection \
       --key file://key.json \
       --return-consumed-capacity TOTAL
  ```

  Contents of key.json:
  ```json
   {
       "Artist": {"S": "Acme Band"},
       "SongTitle": {"S": "Happy Day"}
   }
  ```
