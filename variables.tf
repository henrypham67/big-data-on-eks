variable "aws_region" {
  description = "The AWS region."
  type        = string
}

variable "aws_profile" {
  description = "The AWS CLI profile name."
  type        = string
}

variable "domain_name" {
  description = "The route53 domain name to use for configure ingresses."
  type        = string
}