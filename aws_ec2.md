**EC2 101**

- Elastic Compute Cloud - resizable compute capacity in the cloud
- Pricing models
    - On demand - fixed rate per hour with no commitment
    - Reserved - capacity reservation - offer a significant discount on the hourly charge. Contract terms 1 or 3 years. Good for predictable usage
        - Standard reserved instances - 75% off on demand instances. The more you pay up front and the longer the contract, the greater the discount
        - Convertible reserved isntances - up to 54% off on demand. Change attributes of the RI as long as the exhange results in equal value
        - Scheduled reserved instances - e.g. if you run a school. Fraction of a time period
    - Spot - bid a price for instance capacity - greater savings. May lose instances if price increases. Apps that have flexible start and end times.
    - Dedicated hosts - physical ec2 servers that are dedicated to you. Use existing server-bound software licenses if possible. Regulatory requirements. Can pay for these by the hour (on demand)
- FIGHT DR MC PXZ AU  (servers)

**EC2 Notes** 

- AMI - Amazon Machine Image
- Protect against accidental termination option 🙂
- EBS volume types - root volume can only use SSD or magnetic, but not cold HDD or optimized HDD
    - varied IOPS speeds
    - You can encrypt your root device volumes from the get go
    - Additional volumes
        - Cold HDD (sc1)
        - Throughput optimized HDD (st1) - data warehouses?
        - Delete on termination not checked by default
- Security group - virtual firewall. Allows communication over particular ports (covered in VPC section). e.g. SSH uses port 22
    - Source of 0.0.0.0/0 means open to the whole world
- Key pair - asymmetric encryption
    - public key = padlock. Can go in the ec2 instance
    - private key = key to the padlock. Store locally on your machine
- ssh ec2-user@IP... -i keyfile.pem
- ssh-keygen -y -f MyKP.pem > MyKP.pub  (generate public key)
- -y = yes 😮
- Webserver path for html files: /var/www/html (accessible via port 80)
- Turn on apache service: *service httpd start*
    - *chkconfig on* (runs service if ec2 instance reboots)

**AMI Types (EBS vs Instance Store)**

- Instance Store volumes - Ephemeral Storage
- Instance store volumes cannot be stopped - if host fails, data is lost
- EBS backed instances can be stopped - will not lose data
- Can reboot both, wont lose data
- By default, Root volumes will be deleted on termination. However, with EBS volumes, you can tell AWS to keep the root device volume


**Encrypted Root Device volumes & Snapshots**

- Can provision encrypted root device volumes (EBS) when provisioning ec2 instance
- To do it from an unencrypted root device volume
    - Take a snapshot
    - Take a copy of the snapshot and enable encryption
    - Create an AMI using this encrypted copy
    - Launch instance with AMI
    - Note: You cant take a snapshot that is encrypted and launch it as an unencrypted instance/volume

**Spot Instances**

- Can look at historical price trends and decide on AZ based on this
- CI/CD, testing, image and media rendering, high performance computing (?)
- Persistent = stop and start based on hitting price threshold
- Onetime = closed when price threshold reached
- Spot fleets - collection of spot instances
    - CapcityOptimized
    - LowestPrice - default strategy
    - diversified
    - InstancePPoolsToUseCount - must be used in conjunction with lowestprice

**EC2 Hibernate**

- Suspend to dsik
- Saves contents from the instance memory to your EBS root volume
- We persist the instance EBS root volume and any attached amazon EBS data volumes
- Basically dont need to boot up the OS etc. again
- Good for long running processes / services that take long time to start up
- Root device volume must be encrypted

**Cloudwatch**

- Monitoring service / monitors performance
- Host level metrics
    - CPU
    - Network
    - Disk
    - Status check
- Cloudtrail
    - Like a CCTV
    - Visibility to users and resource activity
    - e.g. an s3 bucket created - cloudtrail

**Elastic File System EFS**

- You can have multiple instances sharing an EFS volume
- Elastic - dont need to reprovision
- Has lifecycle policies (needs to be enabled)
- EC2 instance - yum install -y amazon-efs-utils
- mount -t efs -o tls ...
- Above commands need to run to mount the instance to EFS - run on both instances. Updates on file in 1 instance will be viewable by the other instance
- Only pay for storage you use

**FSX for Windows & FSX for Lustre**

- EFS - When you need distributed, highly resilient storage for Linux instances and linux based applications
- Amazon FSx for Windows - When you need centralised storage for Windows-based applications such as Sharepoint, SQL Server, Workspaces, IIS Web Server etc.
- Amazon FSx for Lustre - When you need high-speed, high-capacity distributed storage. This will be for applications that do High Performance Compute (HPC), financial modelling etc. Remeber that FSx for Lustre can store data directly on S3

**EC2 Placement Groups**

- Clustered placement group - group instances close together in an AZ
- Spread placement group -instances that are each placed on distinct underlying hardware (hardware failure impacts just one instance)
- Partition placement groups - each partition within a placement group has its own set of racks, each rack has its own network and power source --> multiple EC2 instance per partition (as opposed to spread placement group, which is 1 instance per hardware)

**HPC on AWS**

- Storage
    - Snowball/snowmobile
    - AWS datasync
    - Direct connect
        - Dedicated network connection from your premises to AWS
    - Instance attached storage: EBS, instance store
    - Network storage: S3, EFS, FSx for Lustre
- Compute & Networking
    - EC2, EC2 spot fleets, ENA, Placement Groups, EFA
- Orchestration & Automation
    - AWS Batch
    - ParallelCluster
        - cluster management tool
