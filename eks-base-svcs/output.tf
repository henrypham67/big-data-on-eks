output "tls_certificate_arn" {
  description = "The TLS certificate ARN to use for Kubernetes Ingress."
  value       = aws_acm_certificate.bigdataoneks.arn
}