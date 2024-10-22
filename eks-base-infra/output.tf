output "eks_cluster_name" {
  description = "The EKS cluster name."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "The EKS cluster endpoint."
  value       = module.eks.cluster_endpoint
}

output "eks_certificate_authority" {
  description = "The EKS certificate authority."
  value       = module.eks.cluster_certificate_authority_data
}

output "eks_vpc_id" {
  description = "The EKS VPC ID."
  value       = module.vpc.vpc_id
}