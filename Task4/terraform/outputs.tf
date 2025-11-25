output "ready" {
  value = "Future Platform architecture fully configured with Terraform!"
}

output "project_info" {
  value = "${var.project_name} - ${var.environment}"
}

# Platforms and Operations outputs
output "platforms_and_operations" {
  value = {
    postgres    = "localhost:${var.postgres_port}"
    clickhouse  = "localhost:${var.clickhouse_port}"
    minio       = "http://localhost:${var.minio_port}"
    minio_ui    = "http://localhost:${var.minio_console_port}"
    kafka       = "localhost:${var.kafka_port}"
    zookeeper   = "localhost:${var.zookeeper_port}"
  }
}

# Languages and Frameworks outputs
output "languages_and_frameworks" {
  value = {
    go     = "Version: ${var.go_version}"
    python = "Version: ${var.python_version}"
    dotnet = "Version: ${var.dotnet_version}"
  }
}

# Methods and Patterns outputs
output "methods_and_patterns" {
  value = {
    airflow          = "http://localhost:${var.airflow_port}"
    spark_master     = "localhost:${var.spark_port}"
    spark_ui         = "http://localhost:${var.spark_ui_port}"
    event_driven_arch = "Kafka-based event streaming"
    microservices    = "Go-based service architecture"
    data_mesh        = "Domain-oriented data architecture"
    mlops            = "Machine Learning operations platform"
  }
}

# Tools outputs
output "tools" {
  value = {
    datahub   = "http://localhost:${var.datahub_port}"
    superset  = "http://localhost:${var.superset_port}"
    keycloak  = "http://localhost:${var.keycloak_port}"
  }
}

output "service_urls" {
  value = <<EOT
Future Platform Services:

Platforms & Operations:
  PostgreSQL: localhost:${var.postgres_port}
  ClickHouse: localhost:${var.clickhouse_port}
  MinIO: http://localhost:${var.minio_port}
  Kafka: localhost:${var.kafka_port}

Methods & Patterns:
  Airflow: http://localhost:${var.airflow_port}
  Spark: localhost:${var.spark_port}

Tools:
  DataHub: http://localhost:${var.datahub_port}
  Superset: http://localhost:${var.superset_port}
  Keycloak: http://localhost:${var.keycloak_port}
EOT
}

output "architecture_summary" {
  value = <<EOT
Future 2.0 Platform Architecture Complete!

Components by Quadrant:

Platforms & Operations:
  - Apache Spark (Adopt)
  - Apache Kafka (Adopt) 
  - ClickHouse (Adopt)
  - MinIO (Adopt)
  - Apache Airflow (Trial)
  - Apache Iceberg (Trial)
  - Keycloak (Adopt)
  - PostgreSQL (Adopt)

Languages & Frameworks:
  - Go (Trial)
  - Python (Adopt)
  - .NET (Adopt)
  - Next.js (Trial)

Methods & Patterns:
  - Event-Driven Architecture (Adopt)
  - Microservices (Trial)
  - Data Mesh (Assess)
  - MLOps (Assess)

Tools:
  - DataHub (Trial)
  - Superset (Trial)
  - Great Expectations (Trial)
EOT
}