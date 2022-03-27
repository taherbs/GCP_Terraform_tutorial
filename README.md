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
