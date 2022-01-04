# AWS Highly Available Bastions

- NLB (with static IP) routing to 2 Bastions in 2 public subnets/AZs (each of which can connect to the instance on the private subnet)
- Cheap option:
    - Set up auto scaling with min 1, with the Bastion on public subnet with fixed EIP
    - When bastion fails, Autoscaling will detect and spin up another instance on the other public subnet
    - Can use userdata script to take over the EIP, then you can ssh into the newly provisioned bastion
    - However not 100% fault tolerant - downtime possible
