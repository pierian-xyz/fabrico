resource "aws_prometheus_workspace" "amp" {
  alias = local.stack_name
  tags  = local.tags
}
