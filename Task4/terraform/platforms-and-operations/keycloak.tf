# Keycloak IAM configuration

output "keycloak_info" {
  value = "Keycloak IAM on port ${var.keycloak_port}"
}

output "keycloak_features" {
  value = [
    "Single Sign-On (SSO)",
    "Role-Based Access Control (RBAC)",
    "LDAP/AD integration",
    "OAuth2/OIDC support"
  ]
}