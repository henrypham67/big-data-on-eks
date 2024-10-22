variable "aws_region" {
  description = "The AWS region."
  type        = string
}

variable "aws_profile" {
  description = "The AWS CLI profile name."
  type        = string
}

variable "eks_cluster_name" {
  description = "The EKS cluster name."
  type        = string
}

variable "eks_cluster_endpoint" {
  description = "The EKS cluster endpoint."
  type        = string
}

variable "eks_certificate_authority" {
  description = "The EKS certificate authority."
  type        = string
}

variable "eks_vpc_id" {
  description = "The EKS VPC ID."
  type        = string
}

variable "domain_name" {
  description = "The route53 domain name to use for configure ingresses."
  type        = string
}