# AWS Transit Gateway

- Like a hub and spoke model
- Single interface for all stuff to connect to
- Can use it across multiple AWS accounts using RAM (Resource Access Manager)
- Can use RTs to limit how VPCs talk to one another
- Supports IP multicast


## TGW Components
 - Attachments
 - TWG Maximum Transmission Unit (MTU)
 - Route table
 - Associations
 - Route propagation


## TGW Evaluation Order
 - TGW takes preference in a particular order for same addresses that are advertised via different sources (e.g. VPN, direct connect)
 - For example, DX sources take preference over VPN
