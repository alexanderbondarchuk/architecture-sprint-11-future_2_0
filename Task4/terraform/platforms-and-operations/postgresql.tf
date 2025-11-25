# PostgreSQL configuration for metadata storage
# Used by Airflow and DataHub

output "postgres_info" {
  value = "PostgreSQL will run on port ${var.postgres_port}"
}