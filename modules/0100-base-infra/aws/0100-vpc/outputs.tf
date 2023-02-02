output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID for the created VPC"
}

output "vpc_arn" {
  value       = module.vpc.vpc_arn
  description = "VPC ARN for the created VPC"
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "CIDR block for the created VPC"
}

output "vpc_default_security_group_id" {
  value       = module.vpc.default_security_group_id
  description = "Default security group ID for the created VPC"
}

output "vpc_private_subnets" {
  value       = module.vpc.private_subnets
  description = "List of private subnets"
}

output "vpc_public_subnets" {
  value       = module.vpc.public_subnets
  description = "List of public subnets"
}

output "vpc_intra_subnets" {
  value       = module.vpc.intra_subnets
  description = "List of intra subnets"
}


