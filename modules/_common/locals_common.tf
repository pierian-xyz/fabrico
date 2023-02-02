locals {
  organization     = var.organization
  environment      = var.environment
  region           = var.region
  stack_name       = "f6-${local.organization}-${local.environment}"
  vpc_cidr         = var.vpc_cidr
  k8s_version      = "1.24"
  hosted_zone_name = var.hosted_zone_name
  cluster_domain   = "f6-${local.environment}.${local.hosted_zone_name}"

  tags = {
    "fabrico.io/Organization" = local.organization
    "fabrico.io/Environment"  = local.environment
    "fabrico.io/Name"         = local.stack_name
    "fabrico.io/Region"       = local.region
    "fabrico.io/HostedZone"   = local.hosted_zone_name
    "fabrico.io/Domain"       = local.cluster_domain
    "fabrico.io/ManagedBy"    = "Terraform"
  }
}
