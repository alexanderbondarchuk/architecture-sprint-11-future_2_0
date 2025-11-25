output "ready" {
  value = "Terraform configuration is ready!"
}

output "project_info" {
  value = "Future Platform with Airflow and DataHub"
}

output "service_ports" {
  value = {
    postgres = var.postgres_port
    airflow  = var.airflow_port
    datahub  = var.datahub_port
    clickhouse = 8123
    minio     = 9000
    spark     = 7077
  }
}

output "service_urls" {
  value = {
    airflow_ui  = "http://localhost:${var.airflow_port}"
    datahub_ui  = "http://localhost:${var.datahub_port}"
    minio_ui    = "http://localhost:9001"
    spark_ui    = "http://localhost:8081"
  }
}

output "architecture_components" {
  value = [
    "PostgreSQL - Metadata database",
    "ClickHouse - Analytics database",
    "MinIO - Object storage",
    "Apache Spark - Data processing",
    "Apache Airflow - Data orchestration",
    "DataHub - Data catalog and lineage"
  ]
}