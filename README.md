# project-terraform-dev
This repo contains Terraform code to create a dev environment. It contains

1. provider.tf  - to add provider info
2. variables.tf - add all variables definition in this file
3. iam.tf       - to add project level IAM changes
4. projects.tf  - to add project level changes like apis
5. cloudrun.tf  - to add changes for cloudrun
6. output.tf    - to add any output 
7. registry.tf  - to add any changes for registry 

**Prerequisites:**

1. Create a service account "terraform-cli" with "role/owner" in the project. Generate and download the key.
2. In provider.tf, replace credentials file with the above step file name and its path. DON'T check in this file to GitHub.
3. Update variables.tf with project, region and zone ids.

**Steps to run**

***Note: The first apply will fail on CloudRun as the repository doesn't have image.
After first failure, run the GitHub actions job to build and copy container to repository
and then come and re apply this code***

1. Install terraform on local
2. Clone this repo to local
3. Cd to repo location, make your changes and run init, plan and apply
4. For any resource drift, which may happen with Cloud Run services, use -refresh-only option to update state file.

To do

1. Implemet Workload Identity Federation
2. Implement Binary Authorization
3. Create a VPC
4. To secure app url ,look in using Load Balancer with Cloud Armor
5. Use customer managed encryption keys for Artifact Registry
