saltvpctest:
  boto_vpc.present:
    - name: SaltVPCTest
    - cidr_block: 10.0.0.0/24
    - dns_hostnames: True
    - region: us-west-2
    - profile: aws_us-west2

mysubnet:
  boto_vpc.subnet_present:
    - name: mysubnet
    - vpc_name: SaltVPCTest
    - cidr_block: 10.0.0.0/28
    - region: us-west-2
    - profile: aws_us-west2