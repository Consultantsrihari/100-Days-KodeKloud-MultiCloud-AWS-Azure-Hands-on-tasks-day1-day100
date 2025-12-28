## Console (Visual walkthrough) 🔁

Perform these steps in the EC2 Console to change the instance type visually:

1. **Find instance & check status checks**
   - EC2 Console → **Instances** → filter by Name=`devops-ec2` → check the **Status Checks** column
   - If the status says **initializing** wait until it reports **2/2 checks passed** or `ok`.

2. **Stop the instance**
   - Select the instance → **Instance state** → **Stop instance** → confirm

3. **Change instance type**
   - With the instance stopped: **Actions** → **Instance settings** → **Change instance type** → select **t2.nano** → **Apply**

4. **Start the instance and verify**
   - **Instance state** → **Start instance** → wait for `running` and for status checks to pass

Important notes:
- The instance must be **stopped** to change its instance type.
- If the instance uses instance-store volumes (rare for modern AMIs) data might be lost — confirm EBS-backed root volumes are used before changing the type.

Tip: Use the Console for a visual confirmation or the provided script for automated execution.
```

### CLI solution

1. Get instance id for `devops-ec2`:

```bash
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=devops-ec2" --query 'Reservations[0].Instances[0].InstanceId' --output text)
```

2. Wait for status checks to be completed (ensure not `initializing`):

```bash
# Poll until both System and Instance status are ok or non-initializing
while true; do
  INST_STATUS=$(aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].InstanceStatus.Status' --output text)
  SYS_STATUS=$(aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].SystemStatus.Status' --output text)
  echo "Instance: $INST_STATUS, System: $SYS_STATUS"
  if [[ "$INST_STATUS" == "ok" || "$INST_STATUS" == "passed" ]] && [[ "$SYS_STATUS" == "ok" || "$SYS_STATUS" == "passed" ]]; then
    break
  fi
  sleep 5
done
```

3. Stop, modify instance type, and start it:

```bash
aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-stopped --instance-ids "$INSTANCE_ID"
aws ec2 modify-instance-attribute --instance-id "$INSTANCE_ID" --instance-type '{"Value":"t2.nano"}'
aws ec2 start-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_ID"
```

4. Verify:

```bash
aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].{ID:InstanceId,State:State.Name,Type:InstanceType}' --output table
```

## Script: change_instance_type.sh

```bash
#!/usr/bin/env bash
set -euo pipefail
# Ensures the status checks are completed before changing instance type
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=devops-ec2" --query 'Reservations[0].Instances[0].InstanceId' --output text)
if [ -z "$INSTANCE_ID" ] || [ "$INSTANCE_ID" == "None" ]; then
  echo "Could not find instance 'devops-ec2'"
  exit 1
fi
# Wait for status checks to be ok (non-initializing)
while true; do
  INST_STATUS=$(aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].InstanceStatus.Status' --output text)
  SYS_STATUS=$(aws ec2 describe-instance-status --instance-id "$INSTANCE_ID" --include-all-instances --query 'InstanceStatuses[0].SystemStatus.Status' --output text)
  echo "Instance: $INST_STATUS, System: $SYS_STATUS"
  if [[ "$INST_STATUS" == "ok" || "$INST_STATUS" == "passed" ]] && [[ "$SYS_STATUS" == "ok" || "$SYS_STATUS" == "passed" ]]; then
    break
  fi
  sleep 5
done
# Stop the instance
aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-stopped --instance-ids "$INSTANCE_ID"
# Modify type
aws ec2 modify-instance-attribute --instance-id "$INSTANCE_ID" --instance-type '{"Value":"t2.nano"}'
# Start and wait
aws ec2 start-instances --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_ID"
# Final verification
aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].{ID:InstanceId,State:State.Name,Type:InstanceType}' --output table

echo "Instance $INSTANCE_ID changed to t2.nano and is running"

