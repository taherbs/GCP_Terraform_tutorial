# GCP Terraform tutorial

This is an introductory repo grouping terraform templates for GCP with best practices.

## Prerequisites
* [GCP account](https://cloud.google.com/free): You can create one with $300 in free credits
* [GCP Service Account with OWNER privilges](https://cloud.google.com/iam/docs/creating-managing-service-accounts): Store the service account credentials under creds/secrets.json the file should look like [secrets.json.sample](./creds/secrets.json.sample).
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli): Version v1.1.7
* Make: Pre-existing for *nix based systems you can install [here for windows](https://www.gnu.org/software/make/)
* Optional - [gcloud CLI](https://cloud.google.com/sdk/docs/install)

## Usage:
```bash
# Terraform init + get + plan
make terra-plan DIR_PATH=<path>
# Example:
make terra-plan DIR_PATH=./subnets

# Terraform init + get + apply auto-approve
make terra-apply DIR_PATH=<path>
# Example:
make terra-apply DIR_PATH=./modules

# Terraform init + get + destroy auto-approve
make terra-destroy DIR_PATH=<path>
# Example:
make terra-destroy DIR_PATH=./bucket
```

## Useful Gcloud cli commands:
```
gcloud init                                          # Connect to an account + add config
gcloud auth list                                     # List of authenticated accounts accounts
gcloud config configurations list                    # List configured accounts
gcloud config configurations activate <ACCOUNT NAME> # Change between accounts
gcloud config configurations describe <ACCOUNT NAME> #
gcloud projects list                                 # List projets linked to an account
gcloud config set project <PROJECT ID>               # Set project
gcloud components list                               # list installed components
gcloud components install <NAME>                     # install components
```

## Notes:
The structure of a Terraform project can vary depending on the needs of the user and the resources being managed, but there are some common elements that are often included. A typical Terraform project may include the following files and directories:

`main.tf:` This is the main Terraform configuration file, which contains the instructions for building and managing the infrastructure.
`variables.tf:` This file contains the variables that can be used in the main.tf file, allowing users to parameterize their infrastructure.
`outputs.tf:` This file contains the output values that are returned by Terraform after the infrastructure has been created.
`terraform.tfstate:` This file contains the state of the infrastructure managed by Terraform. It is used by Terraform to track the resources it is managing, and it is updated every time Terraform is run.
`terraform.tfvars:` This file contains the values for the variables defined in variables.tf. These values are used by Terraform when creating the infrastructure.
`providers/:` This directory contains the configuration files for the provider(s) being used by Terraform. For example, if you are using the AWS provider, there would be a providers/aws.tf file in this directory.
`modules/:` This directory contains any Terraform modules that are being used in the project. Modules are self-contained packages of Terraform configuration that can be reused in multiple projects.
This is just an example of a possible project structure. The actual structure of a Terraform project may differ depending on the needs of the user and the resources being managed.
