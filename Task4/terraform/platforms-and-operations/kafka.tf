# Apache Kafka configuration

output "kafka_info" {
  value = "Apache Kafka on port ${var.kafka_port}"
}

output "kafka_usage" {
  value = [
    "Event streaming between domains",
    "Real-time data processing",
    "Message broker for microservices"
  ]
}