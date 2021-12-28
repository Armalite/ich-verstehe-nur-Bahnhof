**S3**

- 0 bytes to 5TB files
- S3 is a universal namespace - must have unique name
- Successful uploads provide HTTP 200 status code
- Read after Writes consistency for PUTS of new Objects
    - Be able to read a new object immediately
- Eventual Consistency for overwrite PUTS and DELETES
    - If you overwrite an existing object, and read the file immediately, you **could** get the old version i.e. takes some time to propagate


**S3 Pricing Tiers**

- **S3 Standard**
    - Frequently accessed - 99.99% availability, 99.99999999% durability
    - Over 500TB / month $0.021 per GB
- **S3 - Intelligent Tiering - ** data with unknown or changing access patterns. Takes advantage of S3 Standard and S3 IA
    - Same price
    - Gives access to - Infrequently accessed tier ($0.0125/GB)
- **S3 Standard - Infrequent Access** - for long lived but infrequently accessed data
    - $0.0125/GB
- **S3 One Zone - Infrequent Access -** for re-creatable infrequently accessed data that needs millisecond access
    - $0.01/GB
- **S3 Glacier -** For long term backups and archives with retrieval option 1 min to 12h
    - $0.004/GB
- **S3 Glacier Deep Archive -** Long-term data archiving, accessed once/twice a year. Can be restored within 12h
    - $0.00099/GB

Try avoid S3 standard as much as possible

**S3 Security & Encryption**

- Bucket Policies- bucket level access
- Access Control Lists - individual objects
- Buckets can be configured to create access logs
- **Encryption**
    - Encryption in transit
        - SSL/TLS
    - Encryption At Rest (Server Side)
        - S3 Managed Keys - SSE-S3
        - AWS Key Management Service (KMS), Managed Keys - SSE-KMS (you and Amazon manage the keys together)
        - Customer Provided Keys - SSE-C
    - Client Side Encryption
    - Can individual objects or at bucket level

**S3 Version Control**

- Bucket versioning option when creating a bucket
- Once versioning is enabled, it cannot be disabled (only suspended). Have to delete the bucket to completely turn it off
- Lifecycle rules
- MFA Delete capability
- Each version can have its own 'public' view setting
- Making current version public makes only the current version public
    - Previous versions must be individually set to public
- List versions will still show deleted files. Current state shows 'delete marker' type file
    - To restore a deleted file, you can delete the delete marker file
- Suspend bucket versioning
    - Previous versions will remain
    - Subsequent changes wont be versioned
- Can *permanently delete* individual versions

**S3 Lifecycle Management & Glacier**

- Rule scope
- Can transition between storage classes after certain amount of days
- Can have multiple transitions inside a rule

**S3 Object Lock**

- Write once, read many (WORM) model
- Prevent objects from being deleted or modified fora fixed amount of time / indefinitely
- WORM storage
- Governance mode
    - Cant overwrite or delete an object version or alter its lock settings unless they have special permissions
- Compliance mode
    - protected object version cant be overwritten or deleted by any user, including root user in your AWS account
    - Retention cant be changed or overwritten over the period of the retention period
- Legal hold
    - Prevents an object version from being overwritten or deleted
    - Can be placed on objects by user with the S3 PutObjectLegalHold permission

**S3 Performance**

- S3 Prefix
    - Part between bucketname and object
    - Better performance by spreading reads across different prefixes
    - More prefixes = higher total requests per second
- S3 limitations when using KMS
    - KMS limits
    - Uploads/downloads count towards KMS quota
    - Region specific - 5500, 10000 or 30000
    - Cannot request a quota increase
- Multipart uploads
    - Required for files over 5GB
    - Parallelize uploads
- S3 Byte-Range Fetches (for downloads)
    - Specify byte ranges
    - DL failure isolated to just a specific byte range

**S3 Select & Glacier Select**

- Pull date from S3 using SQL
- Download just the data that is needed
- Glacier select allows you to run SQL on Glacier


**Sharing S3 Buckets Between Accounts**

- 3 Different ways
    - Bucket policies & IAM - Programmatic access only (cant do using console)
    - Bucket ACLs & IAM - Programmatic access only (cant do using console)
    - Cross-account IAM Roles - Programmatic AND console access
        - via AWS Organisations
        - Create a role - to another AWS account. Provide accountid etc.
        - Attach some policies to the role e.g. AmazonS3FullAccess
        - Name the role
        - Get the link from the role summary (for switching roles)
        - To test - sign in to the *other* AWS accounts
            - Go to IAM
            - Add a user
            - Set access type etc.
            - Create a group and assign policy (e.g. AdministratorAccess)
            - ...finish creating User
        - Sign in as the user you just created
                - Click the switch role button and enter necessary details to switch role OR
                - Navigate to the link previously copied from the role summary page from the original aws account

**Cross Region Replication (CRR)**

- Create a new bucket and choose a different region
- In the original bucket, can go to replication rule and create new replication rule
- Choose a role or create a new role for CRR
- Choose destination (bucket in this account or bucket in another account)
- Replication requires versioning to be enabled for the source AND destination bucket (can do this directly through this replication rule setup menu)
- RTC available (replication time control) - guarantees that 99.99% of new objects replicated within 15 minutes --> replication metrics enabled and an additional per GB data transfer fee applies
- Can replicate objects encrypted with AWS KMS or even delete markers
- Replicates new objects only, not existing. So only works from when replication is turned on
- Old versions are not replicated
- Replicated file has separate permissions (changing in source does not change in replicated version)
- e.g. can replicate logs from prod account so we have a version that is untouched/unaltered

**S3 Transfer Acceleration**

- Uses CloudFront Edge NetWork
- Instead of uploading directly to the bucket, we upload to an edge location and then the file(s) are transferred to the S3 buckets via Amazon backbone network
- Google transfer acceleration speed comparison tool

**Data Sync Overview**

- Allows you to move large amount of data into AWS
- DataSync Agent - on a server that connects to your filesystem/NAS. Install on premise to set up the replication
- Encrypts data and accelerates transfer over WAN
- Performs automatic data integrity checks in-transit and at-rest

**Storage Gateway**

- Connects an on-premise software appliance with cloud based storage
- File Gateway (NFS & SMB)
    - Files stored as objects in your S3 buckets
    - Access through a network file system (NFS) mount point
    - Connecting on premise infrastructure to S3 and take advantage of S3 features (lifecycle, encryptio etc.)
- Volume Gateway (iSCSI  "i scuzzy")
    - Stored volumes
        - Primary data locally
        - This data gets backed up to AWS, asynchronously as EBS snapshots
    - Cached volumes
        - Does not do entire dataset locally - only most frequently used data
        - Retains recently read data in your on premise storage gateway cache
    - Data written to these volumes can be asynchronously backed up as PIT snapshots of your volumes
    - Incremental backups
    - Minimize storage charges with compression
- Tape Gateway (VTL)
    - Good for archiving
    - Leverage existing tape drive system and use tape gateway instead
