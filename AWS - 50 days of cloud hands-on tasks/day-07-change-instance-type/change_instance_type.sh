#!/usr/bin/env bash
set -euo pipefail
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
