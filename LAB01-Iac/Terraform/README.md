## Usage

```bash
# Configure the AWS CLI with your credentials and default region
aws configure
# Prompts for AWS Access Key, Secret Key, default region, and output format.
# NOTE: The source using a profile "aws configure --profile={iam users}"

# Initialize a new or existing Terraform configuration, setting up the backend and installing provider plugins
terraform init

# Create an execution plan, showing what actions Terraform will take to reach the desired state defined in the configuration files
terraform plan

# Apply the changes required to reach the desired state of the configuration, as determined by the plan command
terraform apply
```

## NOTE
The source using a profile "aws configure --profile={iam users}"
AWS Provider Version 5.70.0
Terraform Version >= 1.0