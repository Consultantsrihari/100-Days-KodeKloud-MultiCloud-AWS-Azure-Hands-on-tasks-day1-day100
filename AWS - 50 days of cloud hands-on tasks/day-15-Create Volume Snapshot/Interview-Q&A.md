# Day 15: EBS Snapshot – Interview Questions & Answers

---

### Q1: What is an EBS snapshot?
An EBS snapshot is a point-in-time backup of an Amazon EBS volume that is stored
securely in Amazon S3 and managed by AWS.

---

### Q2: Are EBS snapshots full or incremental?
EBS snapshots are **incremental**. After the first snapshot, only changed blocks
are saved, which reduces storage costs.

---

### Q3: Can snapshots be used to restore data?
Yes, snapshots can be used to create new EBS volumes, which can then be attached
to EC2 instances for data recovery.

---

### Q4: Do snapshots impact volume performance?
Creating a snapshot has minimal impact. AWS handles snapshot creation efficiently
in the background.

---

### Q5: Can EBS snapshots be copied to another region?
Yes, EBS snapshots can be copied across AWS regions to support disaster recovery
and global availability.

---

### Q6: Where are EBS snapshots stored?
EBS snapshots are stored in Amazon S3, but they are not directly accessible by users.

---

### Q7: Why are snapshots important in DevOps?
Snapshots are essential for:
- Backup and recovery
- Disaster recovery planning
- Creating AMIs
- Automation and compliance

---

### Q8: How does Terraform help with snapshots?
Terraform allows snapshots to be created using Infrastructure as Code (IaC),
making backups repeatable, version-controlled, and automated.

---

### Q9: What happens if the source volume is deleted?
The snapshot remains intact even if the original EBS volume is deleted.

---

### Q10: How do you verify a snapshot is ready to use?
By checking that the snapshot state is **completed** in the AWS Console or via CLI.
