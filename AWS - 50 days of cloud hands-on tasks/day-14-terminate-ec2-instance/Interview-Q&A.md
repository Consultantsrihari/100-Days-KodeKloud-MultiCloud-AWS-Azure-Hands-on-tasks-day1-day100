# EC2 Termination Interview Questions

### Q1: What happens when an EC2 instance is terminated?
The instance is permanently deleted and cannot be restarted.

---

### Q2: Are EBS volumes deleted on termination?
Root volumes are deleted by default; additional volumes depend on settings.

---

### Q3: Can a terminated instance be recovered?
No, terminated instances cannot be recovered.

---

### Q4: Difference between stop and terminate?
Stop preserves the instance; terminate permanently deletes it.

---

### Q5: How do you safely terminate instances in production?
By validating dependencies, taking backups, and using approval workflows.
