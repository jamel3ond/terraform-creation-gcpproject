# [GCP] Terraform for creation project

<img src="https://download.logo.wine/logo/Google_Cloud_Platform/Google_Cloud_Platform-Logo.wine.png" width="350px">

## Prerequisites
Prepare an environment that can use **Terraform** commands such as Google Cloud Shell, Visual Studio Code.

## Features
* Create GCP project, bind billing account, and created a new project under folder.
* Grant IAM roles in the project.
* Enable APIs in the project

## Least Privilege
In order to execute this module you must have a User/Service Account with the following roles:

- `roles/resourcemanager.projectCreator`
- `roles/resourcemanager.projectIamAdmin`
- `roles/serviceusage.serviceUsageAdmin`

Note: you can checklist all IAM roles of GCP, please click on [this link](https://cloud.google.com/iam/docs/understanding-roles).

## Getting Started
1. Clone the repo
   ```HTTPS
   git clone https://github.com/jamel3ond/terraform-creation-gcpproject.git
   ```
2. Enter to directory
   ```
   cd terraform-creation-gcpproject/
   ```
3. Modify the scipt of "variables.tf" file.
   ```
   vim variables.tf
   ```
4. Execute the script using terraform.
   ```
   terraform init
   terraform plan
   terraform apply -auto-apporve
   ```
