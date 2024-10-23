# AWS EKS Setup with Terraform

This project creates complete EKS cluster in AWS. This project uses common module to host common code and makes it very easy to work on mutiple env like tesst, prod etc
## Architecture
![Terraform-AWS - Architecture.png](https://github.com/Kana-G/Terraform-AWS/blob/main/Terraform-AWS%20-%20Architecture.png)

## Prerequisites

Before you begin, make sure you have the following:

1. **AWS Account**: An active AWS account.
2. **AWS CLI**: Installed and configured with appropriate credentials.
3. **Terraform**: Installed on your local machine (version 0.14 or higher is recommended).
4. **kubectl**: Installed to interact with your EKS cluster.

## Project Structure

- `envs`: Multiple envs
  - `prod`: Production
    - `conf.tf`: Production override variable
    - `main.tf`: Production variable passdown
  - `test`:
    - `conf.tf`: Test override variable
    - `main.tf`: Test variable passdown
- `modules`: Core modules
  - `main.tf`: The main Terraform configuration file.
  - `default_variables.tf`: Defines the default inputs variables for the Terraform configuration. will be overriden from envs
  - `outputs.tf`: Specifies the outputs of the Terraform configuration.
  - `versions.tf`: Specifies the required Terraform and provider versions.
  - `provider.tf`: Configures the AWS provider.
  - `vpc.tf`: Sets up the VPC, subnets, and related networking resources.
  - `iam.tf`: CUser roles and permissions.
  - `cluster.tf`: Configures the EKS cluster.
  - `node-group.tf`: Configures the EKS worker node groups.

## Getting Started

### Step 1: Clone the Repository

Clone this repository to your local machine using the following command:
```git clone https://github.com/Kana-G/Terraform-AWS```
```cd Terraform-AWS/envs/test```
### Step 2: Configure AWS Credentials
```aws configure```
### Step 3: Initialize Terraform
```terraform init```
### Step 4: Review and Modify Variables
Review the variables.tf file and modify the values as needed. You can also create a terraform.tfvars file to provide values for the variables.
### Step 5: Plan and Apply the Configuration
```terraform plan```

```terraform apply```
### Step 6: Configure kubectl
```aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>```
### Step 7: Verify the Cluster
```kubectl get nodes```

## Cleaning Up
```terraform destroy```





