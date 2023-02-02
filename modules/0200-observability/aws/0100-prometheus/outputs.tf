output "prometheus_workspace_id" {
  value       = aws_prometheus_workspace.amp.id
  description = "AWS Managed Prometheus workspace ID"
}

output "prometheus_workspace_endpoint" {
  value       = aws_prometheus_workspace.amp.prometheus_endpoint
  description = "AWS Managed Prometheus workspace ID"
}

output "prometheus_workspace_arn" {
  value       = aws_prometheus_workspace.amp.arn
  description = "AWS Managed Prometheus workspace ID"
}
