# Retrieve existing root hosted zone
data "aws_route53_zone" "root" {
  name = local.hosted_zone_name
}

# Create Sub HostedZone four our deployment
resource "aws_route53_zone" "sub" {
  name = local.cluster_domain
  tags = local.tags
}

# Validate records for the new HostedZone
resource "aws_route53_record" "ns" {
  zone_id = data.aws_route53_zone.root.zone_id
  name    = local.cluster_domain
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.sub.name_servers
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = local.cluster_domain
  zone_id     = aws_route53_zone.sub.zone_id

  subject_alternative_names = [
    "*.${local.cluster_domain}"
  ]

  wait_for_validation = true

  tags = local.tags
}

module "eks_blueprints_edns" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.22.0"

  eks_cluster_id        = var.cluster_name
  eks_cluster_endpoint  = var.cluster_endpoint
  eks_cluster_version   = var.cluster_version
  eks_oidc_provider     = var.oidc_provider
  eks_oidc_provider_arn = var.oidc_provider_arn
  tags                  = local.tags

  # TODO: This is a Bug in the module
  # Remove this once the following is removed in the module
  # https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/modules/kubernetes-addons/external-dns/main.tf#L76
  eks_cluster_domain = local.hosted_zone_name 

  enable_external_dns = true
  external_dns_route53_zone_arns = [
    aws_route53_zone.sub.arn
  ]

  external_dns_helm_config = {
    txtOwnerId   = local.stack_name
    zoneIdFilter = aws_route53_zone.sub.zone_id
    policy       = "sync"
    logLevel     = "debug"
  }
}
