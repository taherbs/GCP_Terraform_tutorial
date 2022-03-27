variable "environment" { default = "dev" }
variable "name" { default = "tbs-vm" }
variable "image" { default = "rhel-cloud/rhel-7" }
variable "region" { default = "us-west1" }
variable "machine_type" {
  type = map(string)
  default = {
    "dev"  = "n1-standard-1"
    "prod" = "n1-standard-2"
  }
}
variable "service_account" { type = list(string) }
