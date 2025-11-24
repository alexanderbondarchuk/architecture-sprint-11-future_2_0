terraform {
  required_version = ">= 1.4.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

locals {
  project_prefix = "${var.project_name}-${var.environment}"
}

# Сеть для всех сервисов
resource "docker_network" "platform" {
  name = "${local.project_prefix}-net"
}

# PostgreSQL для метаданных
resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "postgres" {
  name  = "${local.project_prefix}-postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_username}",
    "POSTGRES_PASSWORD=${var.db_password}",
  ]

  networks_advanced {
    name = docker_network.platform.name
  }

  ports {
    internal = 5432
    external = var.postgres_port
  }

  restart = "unless-stopped"
}

# ClickHouse для аналитики
resource "docker_image" "clickhouse" {
  name = "clickhouse/clickhouse-server:latest"
}

resource "docker_container" "clickhouse" {
  name  = "${local.project_prefix}-clickhouse"
  image = docker_image.clickhouse.image_id

  networks_advanced {
    name = docker_network.platform.name
  }

  ports {
    internal = 8123
    external = var.clickhouse_port
  }

  restart = "unless-stopped"
}

# MinIO как объектное хранилище
resource "docker_image" "minio" {
  name = "minio/minio:latest"
}

resource "docker_container" "minio" {
  name  = "${local.project_prefix}-minio"
  image = docker_image.minio.image_id
  command = ["server", "/data", "--console-address", ":9001"]

  env = [
    "MINIO_ROOT_USER=${var.minio_username}",
    "MINIO_ROOT_PASSWORD=${var.minio_password}",
  ]

  networks_advanced {
    name = docker_network.platform.name
  }

  ports {
    internal = 9000
    external = var.minio_port
  }

  ports {
    internal = 9001
    external = var.minio_console_port
  }

  restart = "unless-stopped"
}

# Apache Airflow для оркестрации
resource "docker_image" "airflow" {
  name = "apache/airflow:2.8.1"
}

resource "docker_container" "airflow" {
  name  = "${local.project_prefix}-airflow"
  image = docker_image.airflow.image_id

  env = [
    "AIRFLOW__CORE__EXECUTOR=LocalExecutor",
    "AIRFLOW__DATABASE__SQL_ALCHEMY_CONN=postgresql://${var.db_username}:${var.db_password}@${local.project_prefix}-postgres:5432/${var.db_name}",
    "AIRFLOW__CORE__LOAD_EXAMPLES=false",
    "_AIRFLOW_DB_UPGRADE=true",
    "_AIRFLOW_WWW_USER_CREATE=true",
    "_AIRFLOW_WWW_USER_USERNAME=${var.airflow_username}",
    "_AIRFLOW_WWW_USER_PASSWORD=${var.airflow_password}",
  ]

  networks_advanced {
    name = docker_network.platform.name
  }

  ports {
    internal = 8080
    external = var.airflow_port
  }

  restart = "unless-stopped"

  depends_on = [docker_container.postgres]
}

# Apache Spark для обработки данных
resource "docker_image" "spark" {
  name = "bitnami/spark:latest"
}

resource "docker_container" "spark" {
  name  = "${local.project_prefix}-spark"
  image = docker_image.spark.image_id

  env = [
    "SPARK_MODE=master"
  ]

  networks_advanced {
    name = docker_network.platform.name
  }

  ports {
    internal = 7077
    external = var.spark_port
  }

  ports {
    internal = 8080
    external = var.spark_ui_port
  }

  restart = "unless-stopped"
}