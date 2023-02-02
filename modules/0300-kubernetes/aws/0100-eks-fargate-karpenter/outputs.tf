output "cluster_name" {
  value       = module.eks.cluster_name
  description = "value of the eks cluster_name"
}

output "cluster_id" {
  value       = module.eks.cluster_id
  description = "value of the eks cluster_id"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "value of the eks cluster_endpoint"
}

output "cluster_version" {
  value       = module.eks.cluster_version
  description = "value of the eks cluster_version"
}

output "cluster_arn" {
  value       = module.eks.cluster_arn
  description = "value of the eks cluster_arn"
}

output "cluster_iam_role_arn" {
  value       = module.eks.cluster_iam_role_arn
  description = "value of the eks cluster_iam_role_arn"
}

output "oidc_provider" {
  value       = module.eks.oidc_provider
  description = "value of the eks oidc_provider"
}

output "oidc_provider_arn" {
  value       = module.eks.oidc_provider_arn
  description = "value of the eks oidc_provider_arn"
}

output "cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
  description = "value of the eks cluster_certificate_authority_data"
}
