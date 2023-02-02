variable "organization" {
  type        = string
  description = "(Required) The organization name. This will generally be name of your company or organization within your company."
}

variable "environment" {
  type        = string
  description = "(Required) The environment name. This can be dev, test, stage, prod, etc."
}

variable "region" {
  type        = string
  description = "(Required) The cloud provider (currently AWS) region to deploy to. This can be us-east-1, us-east-2, us-west-1, us-west-2, etc."
}

variable "hosted_zone_name" {
  type        = string
  description = "(Required) The hosted zone to create the DNS records in."
}

variable "vpc_cidr" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  default     = "10.0.0.0/16"
}
