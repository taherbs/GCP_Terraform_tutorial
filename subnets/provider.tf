variable "path" {
  default = "../creds"
}

provider "google" {
  project     = "vivid-ocean-343019"
  region      = "us-west1"
  credentials = file("${var.path}/secrets.json")
}
