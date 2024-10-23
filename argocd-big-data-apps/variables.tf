variable "tls_certificate_arn" {
  description = "The TLS certificate ARN to use for Kubernetes Ingress."
  type        = string
}

variable "domain_name" {
  description = "The Route53 domain name."
  type        = string
}