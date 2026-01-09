# Day 12 – Solution

## Console Method
- Logged into AWS Console
- Navigated to EBS Volumes
- Attached devops-volume to devops-ec2
- Used device name /dev/sdb
- Verified volume state as in-use

## Automation Method
- Retrieved EC2 instance ID
- Retrieved volume ID
- Attached volume using AWS CLI
- Verified volume attachment

## Result
The EBS volume **devops-volume** was successfully attached to
the EC2 instance **devops-ec2**.
