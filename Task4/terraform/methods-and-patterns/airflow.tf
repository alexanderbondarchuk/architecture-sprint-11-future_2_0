# Apache Airflow configuration for data orchestration

output "airflow_info" {
  value = "Apache Airflow ${var.airflow_version} will run on port ${var.airflow_port}"
}

output "airflow_dependencies" {
  value = [
    "PostgreSQL for metadata",
    "Docker executor",
    "Web UI on port ${var.airflow_port}"
  ]
}