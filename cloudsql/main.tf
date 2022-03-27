# Create Database
resource "google_sql_database_instance" "gcp_database" {
  name             = var.name
  region           = var.db_region
  database_version = var.database_version

  settings {
    tier              = var.tier
    disk_size         = var.disk_size
    activation_policy = var.activation_policy
  }
}

# Create User
resource "google_sql_user" "admin" {
  count    = 1
  name     = var.user_name
  host     = var.user_host
  password = var.user_password
  instance = google_sql_database_instance.gcp_database.name
}
