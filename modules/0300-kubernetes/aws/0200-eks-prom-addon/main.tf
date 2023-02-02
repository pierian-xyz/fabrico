module "eks_blueprints_prometheus" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.22.0"

  eks_cluster_id        = var.cluster_name
  eks_cluster_endpoint  = var.cluster_endpoint
  eks_cluster_version   = var.cluster_version
  eks_oidc_provider     = var.oidc_provider
  eks_oidc_provider_arn = var.oidc_provider_arn
  tags                  = local.tags

  enable_prometheus                    = true
  enable_amazon_prometheus             = true
  amazon_prometheus_workspace_endpoint = var.prometheus_workspace_endpoint

  # Enable Logging
  enable_aws_for_fluentbit = true
  enable_fargate_fluentbit = true


  # ADD Grafana
  enable_grafana = true
}
