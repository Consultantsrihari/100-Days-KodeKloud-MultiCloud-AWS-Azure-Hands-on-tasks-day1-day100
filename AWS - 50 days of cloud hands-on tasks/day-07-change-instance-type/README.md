# Day 07 — Change Instance Type to `t2.nano`

## Goal
Safely change the instance type for the instance named `devops-ec2` from `t2.micro` to `t2.nano`. Ensure status checks are completed before making changes and that the instance is `running` with checks passing after the change.

## Notes
- You must stop the instance to change the instance type.
- Wait for the instance to enter `stopped`, then use `modify-instance-attribute` to change the type, then start it and wait for `running` and status checks to pass.

## Steps (CLI)

1. Find the InstanceId for `devops-ec2`:

```bash
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=devops-ec2" --query 'Reservations[0].Instances[0].InstanceId' --output text)
```

2. Wait until status checks have completed (not `initializing`) or show `ok`:

```bash
aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].InstanceStatus.Status'
aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].SystemStatus.Status'
```

If status is `initializing`, wait until it reports `ok` or `passed`.

3. Stop the instance:

```bash
aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-stopped --instance-ids "$INSTANCE_ID"
```

4. Modify the instance type:

```bash
aws ec2 modify-instance-attribute --instance-id "$INSTANCE_ID" --instance-type "{\"Value\":\"t2.nano\"}"
```

5. Start the instance and wait for it to be running and pass status checks:

```bash
aws ec2 start-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
# wait for status checks to pass
aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_ID"
```

6. Verify instance type and running state:

```bash
aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].{ID:InstanceId,State:State.Name,Type:InstanceType}' --output table
```

## Script
`change_instance_type.sh` automates these steps for `devops-ec2`.
