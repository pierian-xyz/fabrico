output "cluster_name" {
  value       = local.stack_name
  description = "value of the eks cluster_name"
}

output "cluster_id" {
  value       = module.eks_blueprints.eks_cluster_id
  description = "value of the eks cluster_id"
}

output "cluster_arn" {
  value       = module.eks_blueprints.eks_cluster_arn
  description = "value of the eks cluster_arn"
}

output "cluster_endpoint" {
  value       = module.eks_blueprints.eks_cluster_endpoint
  description = "value of the eks cluster_endpoint"
}

output "cluster_version" {
  value       = module.eks_blueprints.eks_cluster_version
  description = "value of the eks cluster_version"
}

output "oidc_provider" {
  value       = module.eks_blueprints.oidc_provider
  description = "value of the eks oidc_provider"
}

output "oidc_provider_arn" {
  value       = module.eks_blueprints.eks_oidc_provider_arn
  description = "value of the eks oidc_provider_arn"
}

output "oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  value       = module.eks_blueprints.eks_oidc_issuer_url
}

output "cluster_certificate_authority_data" {
  value       = module.eks_blueprints.eks_cluster_certificate_authority_data
  description = "value of the eks cluster_certificate_authority_data"
}

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks --region ${local.region} update-kubeconfig --name ${module.eks_blueprints.eks_cluster_id}"
}