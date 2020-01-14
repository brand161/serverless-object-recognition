#!/bin/sh

# git clone https://github.com/brand161/serverless-object-recognition.git
export AWS_DEFAULT_REGION='us-west-2'
export C9_EC2_ID=`aws ec2 describe-instances --region us-west-2 --filters Name=tag-key,Values='aws:cloud9:environment' Name=instance-state-name,Values='running' --query "Reservations[*].Instances[*].InstanceId" --output text`
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=RTWorkshopInstanceProfile --region us-west-2 --instance-id $C9_EC2_ID
python3 -m venv tmp-workshop-dir; source tmp-workshop-dir/bin/activate
cd tmp-workshop-dir
pip --disable-pip-version-check install -q boto3
pip --disable-pip-version-check install -q chalice
pip --disable-pip-version-check install -q opencv-python
