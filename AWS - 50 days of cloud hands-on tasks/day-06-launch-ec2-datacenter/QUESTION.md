# Day 06 — Launch an EC2 instance (Amazon Linux, t2.micro)

## Task
Create an EC2 instance with the following requirements:

1) Instance name: `datacenter-ec2`
2) Use an Amazon Linux AMI
3) Instance type: `t2.micro`
4) Create a new RSA key pair named `datacenter-kp` and save the private key
5) Attach the default security group

## Acceptance criteria
- An EC2 instance named `datacenter-ec2` exists and is running.
- The instance uses an Amazon Linux AMI and type `t2.micro`.
- A key pair `datacenter-kp` exists (private key saved locally) and was used to launch the instance.
- The instance is associated with the default security group (usually `default` for the VPC).
