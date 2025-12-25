Solution (AWS CLI)

1) Allocate an Elastic IP (VPC scope) and tag it `xfusion-eip`:

```bash
# allocate
aws ec2 allocate-address --domain vpc --output json
# sample output contains AllocationId and PublicIp
# then tag the allocation
aws ec2 create-tags --resources <allocation-id> --tags Key=Name,Value=xfusion-eip
```

2) (Optional) Associate the Elastic IP to an instance:

```bash
# associate by allocation id (recommended)
aws ec2 associate-address --instance-id <instance-id> --allocation-id <allocation-id>

# or associate by public ip (legacy)
aws ec2 associate-address --instance-id <instance-id> --public-ip <public-ip>
```

3) Verify the EIP exists and check tags / association:

```bash
# find by tag
aws ec2 describe-addresses --filters "Name=tag:Name,Values=xfusion-eip" --output table

# show by allocation id
aws ec2 describe-addresses --allocation-ids <allocation-id> --output json
```

4) Cleanup when finished (disassociate & release):

```bash
# disassociate
aws ec2 disassociate-address --association-id <association-id>
# release EIP
aws ec2 release-address --allocation-id <allocation-id>
```

Using the AWS Console (GUI)

1) Sign in to the AWS Console: https://console.aws.amazon.com/
2) Open the **EC2** service.
3) In the left-hand menu, expand **Network & Security** → **Elastic IPs**.
4) Click **Allocate Elastic IP address** → **Allocate**. (Select `Amazon's pool` and `VPC` scope.)
5) Select the new EIP in the list, choose **Actions** → **Manage tags** (or **Edit tags**) to add `Name=xfusion-eip`.
6) To attach: with the EIP selected, **Actions** → **Associate address** → choose **Instance** and pick the target EC2 instance → **Associate**.
7) Verify details in the Elastic IPs list (Public IPv4 address, Allocation ID, Instance ID if attached).

Using Python (boto3)

Install dependencies:

```bash
pip install boto3
```

Example script (see `create_eip.py`):

```bash
python create_eip.py --name xfusion-eip [--associate INSTANCE_ID]
```

Notes

- Replace placeholders like `<allocation-id>`, `<instance-id>`, and `<public-ip>` with actual values from the CLI output.
- Make sure you operate in the intended AWS Region and account.
