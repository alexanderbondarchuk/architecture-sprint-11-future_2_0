variable "project_name" {
  type    = string
  default = "future-platform"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "airflow_version" {
  type    = string
  default = "2.8.1"
}

variable "datahub_version" {
  type    = string
  default = "latest"
}

variable "postgres_port" {
  type    = number
  default = 5432
}

variable "airflow_port" {
  type    = number
  default = 8080
}

variable "datahub_port" {
  type    = number
  default = 9002
}