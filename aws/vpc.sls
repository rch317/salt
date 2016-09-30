### Create the VPC
saltvpctest:
  boto_vpc.present:
    - name: SaltVPCTest
    - cidr_block: 10.0.0.0/24
    - dns_hostnames: True
    - profile: aws_us-west2

### Create the Subnet
mysubnet:
  boto_vpc.subnet_present:
    - name: mysubnet
    - vpc_name: SaltVPCTest
    - cidr_block: 10.0.0.0/28
    - profile: aws_us-west2

public subnet:
  boto_vpc.subnet_present:
    - name: mysubnet_public
    - vpc_name: SaltVPCTest
    - cidr_block: 10.0.0.16/28
    - profile: aws_us-west2

### Create the Internet Gateway
vpctestigw:
  boto_vpc.internet_gateway_present:
    - name: myigw
    - vpc_name: SaltVPCTest
    - profile: aws_us-west2

### Create the route tables
mysubnet_route_table:
  boto_vpc.route_table_present:
    - name: my_route_table
    - vpc_name: SaltVPCTest
    - routes:
      - destination_cidr_block: 0.0.0.0/0
        internet_gateway_name: myigw2
      - subnet_names:
        - mysubnet
        - mysubnet_public
    - profile: aws_us-west2