variable "environment" { default = "dev" }
variable "image" { default = "rhel-cloud/rhel-7" } # CMD: gcloud compute images list
variable "machine_names" {
  default = ["test1", "test2"]
}
variable "zone" { default = "us-west1-a" }
variable "machine_count" { default = "1" }
variable "machine_type" {
  type = map(string)
  default = {
    "dev"  = "n1-standard-1"
    "prod" = "n1-standard-2"
  }
}
variable "source_ip_ranges" {
  type = map(list(string))
  default = {
    "dev"  = ["184.162.202.56/32"]
    "prod" = ["0.0.0.0/0"]
  }
}
