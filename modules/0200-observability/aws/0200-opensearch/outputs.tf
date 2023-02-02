output "opensearch_domain_endpoint" {
  description = "Amazon OpenSearch Domain endpoint"
  value       = aws_opensearch_domain.opensearch.endpoint
}

output "opensearch_domain_arn" {
  description = "Amazon OpenSearch Domain ARN"
  value       = aws_opensearch_domain.opensearch.arn
}
