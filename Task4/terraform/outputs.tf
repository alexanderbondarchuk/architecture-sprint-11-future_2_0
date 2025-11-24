output "network_name" {
  description = "Имя Docker сети"
  value       = docker_network.platform.name
}

output "postgres_connection" {
  description = "Подключение к PostgreSQL"
  value       = "localhost:${var.postgres_port}"
}

output "clickhouse_connection" {
  description = "Подключение к ClickHouse"
  value       = "localhost:${var.clickhouse_port}"
}

output "minio_connection" {
  description = "Подключение к MinIO"
  value       = {
    api     = "http://localhost:${var.minio_port}"
    console = "http://localhost:${var.minio_console_port}"
  }
}

output "airflow_connection" {
  description = "Подключение к Airflow"
  value       = "http://localhost:${var.airflow_port}"
}

output "spark_connection" {
  description = "Подключение к Spark"
  value       = {
    master = "localhost:${var.spark_port}"
    ui     = "http://localhost:${var.spark_ui_port}"
  }
}

output "service_urls" {
  description = "URL всех сервисов"
  value       = <<EOT
Future Platform Services:

PostgreSQL: localhost:${var.postgres_port}
ClickHouse: localhost:${var.clickhouse_port}
MinIO API: http://localhost:${var.minio_port}
MinIO Console: http://localhost:${var.minio_console_port}
Airflow: http://localhost:${var.airflow_port}
Spark Master: localhost:${var.spark_port}
Spark UI: http://localhost:${var.spark_ui_port}
EOT
}