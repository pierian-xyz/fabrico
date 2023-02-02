variable "cluster_name" {
  type        = string
  description = "(Required) The EKS cluster name."
}

variable "cluster_id" {
  type        = string
  description = "(Optional) The EKS cluster ID."
  default = ""
}

variable "cluster_arn" {
  type        = string
  description = "(Optional) The EKS cluster ARN."
}

variable "cluster_endpoint" {
  type        = string
  description = "(Required) The EKS cluster endpoint."
}

variable "cluster_version" {
  type        = string
  description = "(Required) The EKS cluster version."
}

variable "oidc_provider" {
  type        = string
  description = "(Required) The EKS OIDC provider."
}

variable "oidc_provider_arn" {
  type        = string
  description = "(Required) The EKS OIDC provider ARN."
}

variable "cluster_certificate_authority_data" {
  type        = string
  description = "(Required) The EKS cluster certificate authority data."
}
