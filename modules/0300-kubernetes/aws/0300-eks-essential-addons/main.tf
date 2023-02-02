module "eks_blueprints_essentials" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.22.0"

  eks_cluster_id        = var.cluster_name
  eks_cluster_endpoint  = var.cluster_endpoint
  eks_cluster_version   = var.cluster_version
  eks_oidc_provider     = var.oidc_provider
  eks_oidc_provider_arn = var.oidc_provider_arn
  tags                  = local.tags

  # EKS Managed Add-ons
  enable_aws_load_balancer_controller = true

  # Add-ons
  enable_metrics_server                = true
  enable_aws_cloudwatch_metrics        = true
  # TBD: Deploy kubecost integrating with Prometheus so that it doesn't deploy
  # its own Prometheus Node Exporter and Kube State Metrics. We will have to configure Pormetheus
  # to scrape the kubecost metrics.
  # enable_kubecost                      = true
  enable_gatekeeper                    = true
  enable_cert_manager                  = true
  enable_calico                        = true
}
