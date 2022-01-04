# Load Balancers

- Connect to public subnets (at least 2)
- Directs traffic to the healthy points
- ALB, NLB, CLB
- Load balancers always get only DNS names, except NLB - can get static IP
- ALB
    - Operates at layer 7
    - Best for load balancing HTTP and HTTPS traffic
    - Intelligent
    - Send specified requests to specific web servers
    - Can see inside the application layer
- NLB
    - Load balancing of TCP traffic where extreme performance is required
    - Operates at the connection level (layer 4)
    - Can handle millions of requests per second - while maintaining ultra low latency
- CLB
    - Can load balance HTTP/HTTPS appplications and use layer 7 features, such as the X-forwarded headers and sticky sessions.
    - Can also use layer 4 load balancing for apps that rely purely on TCP protocol.
    - Cannot look into application layer
- 504 error
    - Gateway timeout
    - Instance not responding
    - Not a LB error
- Sticky sessions
    - Can disable sticky sessions
    - Happens when LB is directing traffic to just one instance
    - Enables users to stic kto the same ec2 instance
- Cross zone LB
    - Must be enabled otherwise cant sent traffic to another AZ
    - When enabled, total traffic is divided by the number of instances, since LBs can send traffic to any LB regardless of AZ
- Path Patterns
    - Must be enabled
    - Path based routine
    - LB can used path based rules to direct traffic to a particular direction/instance
- SSH/RDP = layer 4  - therefore needs Network Load Balancer (Layer 4), cant use ALB (Layer 7)
- NLB are expensive ish

**HA Architecture**

- Netflix high availability tests - Simian army
    - Chaos monkley
    - Chaos Gorilla
    - Chaos Kong
    - Janitor Monkey
    - Security Monkey
    - etc.
- Scaling up
    - Increase resources e.g. t2.micro to small
- Scaling out
    - Adding additional resources/instances e.g. new ec2 instance


**Cloudfront Distros**

- Use for stuff like web servers - e.g. have website images served up through cloudfront pulling out of S3


**On Premise Strategies**

- Database migration service (DMS)
    - homogenous migration
    - heterogenous migration
- Server migration service (SMS)
- AWS Application Discovery Service
- VM Import/Export
