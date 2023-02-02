output "aws_route53_zone_root_id" {
  description = "The new Route53 Zone ID"
  value       = data.aws_route53_zone.root.zone_id
}

output "aws_route53_zone_name" {
  description = "The new Route53 Zone"
  value       = aws_route53_zone.sub.name
}

output "aws_route53_zone_id" {
  description = "The new Route53 Zone ID"
  value       = aws_route53_zone.sub.zone_id
}

output "aws_acm_certificate_arn" {
  description = "ARN of Certificate"
  value       = module.acm.acm_certificate_arn
}

output "aws_acm_certificate_status" {
  description = "Status of Certificate"
  value       = module.acm.acm_certificate_status
}
