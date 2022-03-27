output "name" { value = join(",", google_compute_instance.test_instance.*.name) }
output "machine_type" { value = google_compute_instance.test_instance.*.machine_type }
output "zone" { value = google_compute_instance.test_instance.*.zone }
