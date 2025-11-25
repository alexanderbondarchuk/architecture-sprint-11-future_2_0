# DataHub configuration

output "datahub_info" {
  value = "DataHub ${var.datahub_version} on port ${var.datahub_port}"
}

output "datahub_features" {
  value = [
    "Data catalog and discovery",
    "Data lineage tracking",
    "Metadata management",
    "Data quality monitoring"
  ]
}