variable "project_name" {
  description = "Название проекта"
  type        = string
  default     = "future-platform"
}

variable "environment" {
  description = "Окружение"
  type        = string
  default     = "dev"
}

variable "db_name" {
  description = "Имя базы данных"
  type        = string
  default     = "platform"
}

variable "db_username" {
  description = "Пользователь базы данных"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Пароль базы данных"
  type        = string
  sensitive   = true
  default     = "admin123"
}

variable "postgres_port" {
  description = "Порт PostgreSQL"
  type        = number
  default     = 5432
}

variable "clickhouse_port" {
  description = "Порт ClickHouse"
  type        = number
  default     = 8123
}

variable "minio_username" {
  description = "Пользователь MinIO"
  type        = string
  default     = "minioadmin"
}

variable "minio_password" {
  description = "Пароль MinIO"
  type        = string
  sensitive   = true
  default     = "minioadmin123"
}

variable "minio_port" {
  description = "Порт MinIO API"
  type        = number
  default     = 9000
}

variable "minio_console_port" {
  description = "Порт MinIO Console"
  type        = number
  default     = 9001
}

variable "airflow_username" {
  description = "Пользователь Airflow"
  type        = string
  default     = "admin"
}

variable "airflow_password" {
  description = "Пароль Airflow"
  type        = string
  sensitive   = true
  default     = "admin123"
}

variable "airflow_port" {
  description = "Порт Airflow"
  type        = number
  default     = 8080
}

variable "spark_port" {
  description = "Порт Spark Master"
  type        = number
  default     = 7077
}

variable "spark_ui_port" {
  description = "Порт Spark UI"
  type        = number
  default     = 8081
}