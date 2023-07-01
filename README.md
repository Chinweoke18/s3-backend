# Creating S3 terraform backend.

S3 is used to store the terraform state file. S3 is used in conjuction with DynamoDB table for state locking. A single DynamoDB table can be used to lock multiple remote state files. 

## How to run the project

First, [clone the git repo](git@github.com:prophius/paycontactless_portal_web.git).
access the folder "s3-backend"
Execute the following terraform cammand

- terraform init
- teraform apply --auto-approve
