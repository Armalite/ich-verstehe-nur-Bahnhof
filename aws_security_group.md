**Security Groups Basics**

- Port 80 http port
- Security group - can view inbound rules - which ports are open to which source
- ipv6 open to world source setting: ::/0
- Any security group rule change takes effect **immediately**
- Outbound rules: everything to everything in the lab
    - Stateful!
    - If you allow SSH in, SSH out is also enabled
    - So webserver will still work if inbound rule exists but outbound is removed
    - **However,**  **network access control lists (NACL)**** are stateless**
- Can't blacklist or block ports/IPs using security groups - must do using NACLs
- Everything is blocked by default in security groups
- All outbound traffic is allowed
- Can attach more than 1 security group to an ec2 instance
