variable "environment" {
  default = "dev"
}
variable "zone" {
  default = "us-west1-a"
}
variable "machine_type" {
  type = map(string)
  default = {
    "dev"  = "n1-standard-1"
    "prod" = "n1-standard-2"
  }
}

variable "os" {
  default = "debian-cloud/debian-9"
}

variable "machine_names" {
  default = ["test1", "test2"]
}
