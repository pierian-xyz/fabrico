variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID to deploy to."
}

variable "vpc_arn" {
  type        = string
  description = "(Required) The VPC ARN to deploy to."
}

variable "vpc_cidr_block" {
  type        = string
  description = "(Required) The CIDR block for the VPC."
}

variable "vpc_default_security_group_id" {
  type        = string
  description = "(Required) The default security group ID for the VPC."
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "(Required) The list of private subnets to deploy to."
}

variable "vpc_intra_subnets" {
  type        = list(string)
  description = "(Required) The list of intra subnets to deploy to."
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "(Required) The list of public subnets to deploy to."
}
