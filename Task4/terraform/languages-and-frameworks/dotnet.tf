# .NET configuration for enterprise systems

output "dotnet_info" {
  value = ".NET ${var.dotnet_version} for enterprise applications"
}

output "dotnet_usage" {
  value = [
    "Medical domain systems",
    "Legacy system integration",
    "Enterprise services"
  ]
}