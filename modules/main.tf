module "instance" {
  source      = "../simple-vm"
  environment = "prod"
  os          = "debian-cloud/debian-9"
}

module "instance_two" {
  source      = "../vm-firewall-disk"
  environment = "prod"
  image       = "debian-cloud/debian-9"
}

module "bucket" {
  source      = "../bucket"
  bucket_name = "overwrite-bucket-name"
}
