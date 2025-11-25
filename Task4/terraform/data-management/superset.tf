# Apache Superset configuration

output "superset_info" {
  value = "Apache Superset on port ${var.superset_port}"
}

output "superset_usage" {
  value = [
    "Business intelligence dashboards",
    "Data visualization",
    "Ad-hoc analytics"
  ]
}