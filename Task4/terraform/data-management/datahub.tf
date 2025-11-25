# DataHub configuration for data catalog and lineage

output "datahub_info" {
  value = "DataHub ${var.datahub_version} will run on port ${var.datahub_port}"
}

output "datahub_components" {
  value = [
    "Data Catalog",
    "Data Lineage",
    "Metadata Management",
    "Search and Discovery"
  ]
}

output "datahub_integrations" {
  value = [
    "PostgreSQL for metadata",
    "Kafka for events",
    "Elasticsearch for search"
  ]
}