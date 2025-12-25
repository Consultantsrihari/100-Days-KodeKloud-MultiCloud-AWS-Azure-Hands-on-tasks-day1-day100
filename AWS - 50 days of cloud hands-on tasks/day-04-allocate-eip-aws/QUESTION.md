Day 4 — Allocate & attach an Elastic IP (EIP)

Task

The Nautilus (renamed to AWS) DevOps team is continuing a phased migration to AWS. For Day 4, allocate an Elastic IP (EIP) and name/tag it `xfusion-eip`. Optionally, attach (associate) the EIP to an EC2 instance.

Acceptance criteria

- An Elastic IP is allocated in your AWS account (VPC scope) and has the tag `Name=xfusion-eip`.
- (Optional) The EIP is associated with a specified EC2 instance (provide instance id).

Verification

- Use `aws ec2 describe-addresses --filters Name=tag:Name,Values=xfusion-eip -o table` or check the **Elastic IPs** page in the EC2 Console.
- If associated: `aws ec2 describe-addresses --allocation-ids <allocation-id>` and confirm `InstanceId` is set.

Hints

- Use the AWS CLI, the Console (GUI), or the Python SDK (`boto3`).
- Be sure your AWS CLI is configured with the correct credentials and region: `aws configure`.
