# Day 04 — Allocate & Attach an Elastic IP (EIP) in AWS

This task covers allocating an Elastic IP (EIP) named `xfusion-eip` and optionally attaching it to an EC2 instance.

Files included:

- `QUESTION.md` — Task description and acceptance criteria
- `ANSWERS.md` — CLI, GUI, and Python examples to allocate and attach an EIP
- `create_eip.sh` — Bash script using AWS CLI to allocate, tag, and optionally associate an EIP
- `create_eip.py` — Python script using `boto3` to perform the same
- `YOUTUBE.md` — YouTube thumbnail, title, description, tags and hashtags template for a tutorial video

## Quick usage (CLI)

```bash
# Allocate and tag
aws ec2 allocate-address --domain vpc --output json
aws ec2 create-tags --resources <allocation-id> --tags Key=Name,Value=xfusion-eip

# Allocate + tag + associate to instance with script
chmod +x create_eip.sh
./create_eip.sh xfusion-eip i-0123456789abcdef0

# Or python
pip install boto3
python create_eip.py --name xfusion-eip --associate i-0123456789abcdef0
```

Notes

- Ensure your AWS CLI / boto3 credentials are configured and you are in the intended AWS Region/account.
- Clean up with `aws ec2 disassociate-address --association-id <association-id>` then `aws ec2 release-address --allocation-id <allocation-id>` when you're done.

## Resources & Links ✅
- YouTube playlist: https://www.youtube.com/@TechCareerHubs
- GitHub (repo, scripts): https://github.com/Consultantsrihari/100-Days-KodeKloud-MultiCloud-AWS-Azure-Hands-on-tasks-day1-day100
- LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- Instagram: https://www.instagram.com/techcareerhubs/?hl=en
- Website: https://techcareerhubs.com/
- Telegram: https://t.me/+aUHeeIHnADJjZmE1
- KodeKloud registration: https://engineer.kodekloud.com/signup?referral=6946cfc4dee212a47f43cdd4
- AWS Console: https://console.aws.amazon.com/
- Azure Portal: https://portal.azure.com/

